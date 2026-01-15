import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Campus {
  final String name;
  final String query; // address or coordinates

  const Campus({required this.name, required this.query});
}

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  static const campuses = <Campus>[
    Campus(name: 'Centria Kokkola', query: 'Centria, Kokkola, Finland'),
    Campus(
        name: 'Centria Iisalmi', query: 'Centria Talonpojankatu 2A, Iisalmi'),
  ];

  Campus selected = campuses[0]; // ✅ default to Kokkola

  Uri get googleMapsLink => Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(selected.query)}');

  Future<void> _openMaps() async {
    if (!await launchUrl(googleMapsLink, mode: LaunchMode.platformDefault)) {
      debugPrint('Could not launch Google Maps link');
    }
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Centria Campus Location')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: scheme.secondary),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<Campus>(
                              value: selected,
                              isExpanded: true,
                              items: campuses
                                  .map(
                                    (c) => DropdownMenuItem(
                                      value: c,
                                      child: Text(c.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (c) {
                                if (c == null) return;
                                setState(() => selected = c);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        FilledButton.icon(
                          onPressed: _openMaps,
                          icon: const Icon(Icons.open_in_new),
                          label: const Text('Open'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        selected.query,
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: kIsWeb
                  ? _WebEmbedHint(open: _openMaps)
                  : Center(
                      child: Text(
                        'Tap "Open" to view the map in Google Maps.',
                        style: TextStyle(color: scheme.onSurfaceVariant),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Keeping it simple: avoid Google Maps JS API key problems on web.
/// If you want real iframe embed inside Flutter Web, tell me and I’ll paste the
/// web-only HtmlElementView code.
class _WebEmbedHint extends StatelessWidget {
  final Future<void> Function() open;
  const _WebEmbedHint({required this.open});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Web embed ready.\nUse the Open button to view it in Google Maps.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: open,
            icon: const Icon(Icons.open_in_new),
            label: const Text('Open in Google Maps'),
          )
        ],
      ),
    );
  }
}
