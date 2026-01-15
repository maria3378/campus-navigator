import 'package:flutter/material.dart';

import '../data/room_data.dart';
import '../widgets/room_card.dart';
import 'floor_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Room> get _filtered {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return rooms;
    return rooms.where((r) => r.searchKey.contains(q)).toList(growable: false);
  }

  void _openRoom(Room room) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) {
        final scheme = Theme.of(context).colorScheme;
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: scheme.primary.withOpacity(0.12),
                    foregroundColor: scheme.primary,
                    child: Text(room.id,
                        style: const TextStyle(fontWeight: FontWeight.w800)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      room.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Floor: ${room.floor}\nType: ${room.type.label}'),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => FloorView(
                        initialFloor: room.floor,
                        highlightRoomId: room.id,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.layers),
                label: const Text('Show on floor map'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final items = _filtered;

    return Scaffold(
      appBar: AppBar(title: const Text('Search Rooms')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              controller: _controller,
              onChanged: (v) => setState(() => _query = v),
              decoration: InputDecoration(
                hintText: 'Search by room ID or name',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                        icon: const Icon(Icons.close),
                      ),
                filled: true,
                fillColor: scheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? Center(
                    child: Text(
                      'No rooms found.',
                      style: TextStyle(color: scheme.onSurfaceVariant),
                    ),
                  )
                : ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (_, i) {
                      final room = items[i];
                      return RoomCard(room: room, onTap: () => _openRoom(room));
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
