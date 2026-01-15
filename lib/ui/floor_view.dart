import 'package:flutter/material.dart';

class FloorView extends StatefulWidget {
  final int initialFloor;
  final String? highlightRoomId;

  const FloorView({super.key, this.initialFloor = 0, this.highlightRoomId});

  @override
  State<FloorView> createState() => _FloorViewState();
}

class _FloorViewState extends State<FloorView> {
  late int selectedFloor;

  @override
  void initState() {
    super.initState();
    selectedFloor = widget.initialFloor.clamp(0, 2);
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Floor Maps'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: scheme.primary.withOpacity(0.08),
                border: Border.all(color: scheme.primary.withOpacity(0.20)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Select a floor to view the layout',
                      style: TextStyle(
                        color: scheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ToggleButtons(
                    isSelected: [
                      selectedFloor == 0,
                      selectedFloor == 1,
                      selectedFloor == 2
                    ],
                    onPressed: (index) => setState(() => selectedFloor = index),
                    borderRadius: BorderRadius.circular(12),
                    selectedColor: scheme.onPrimary,
                    fillColor: scheme.primary,
                    color: scheme.primary,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('G'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('1'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('2'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (widget.highlightRoomId != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Row(
                children: [
                  Icon(Icons.place, color: scheme.secondary, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Selected room: ${widget.highlightRoomId}',
                      style: TextStyle(
                        color: scheme.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: InteractiveViewer(
                  minScale: 0.7,
                  maxScale: 4,
                  child: Image.asset(
                    'assets/floor_$selectedFloor.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
