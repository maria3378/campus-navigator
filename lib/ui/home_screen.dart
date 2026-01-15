import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final void Function(int) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Hero header with image + overlay text/buttons
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/centria.png',
                    height: 240,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 240,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          scheme.primary.withOpacity(0.80),
                          Colors.black.withOpacity(0.25),
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Welcome to Centria',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Use this app to find rooms faster, explore floor maps, and open the campus location in Google Maps.',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Colors.white.withOpacity(0.95),
                                ),
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              _QuickAction(
                                icon: Icons.layers,
                                label: 'Floors',
                                onTap: () => onNavigate(1),
                              ),
                              _QuickAction(
                                icon: Icons.map,
                                label: 'Map',
                                onTap: () => onNavigate(2),
                              ),
                              _QuickAction(
                                icon: Icons.search,
                                label: 'Search',
                                onTap: () => onNavigate(3),
                              ),
                              _QuickAction(
                                icon: Icons.settings,
                                label: 'Settings',
                                onTap: () => onNavigate(4),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _SectionCard(
              title: 'How to use this app',
              icon: Icons.help_outline,
              children: const [
                _Bullet(
                    'Open “Floors” to view Ground, 1st, and 2nd floor maps.'),
                _Bullet('Use pinch/scroll to zoom and drag to pan the map.'),
                _Bullet(
                    'Open “Search” to find a room by ID (e.g., 014) or name (e.g., Library).'),
                _Bullet(
                    'Open “Map” to launch Centria campus location in Google Maps.'),
                _Bullet('Use “Settings” for dark mode and preferences.'),
              ],
            ),

            const SizedBox(height: 12),

            _SectionCard(
              title: 'Student location tips',
              icon: Icons.tips_and_updates_outlined,
              children: const [
                _Bullet(
                    'If you have a room number, search it first (fastest method).'),
                _Bullet(
                    'The first digit often hints the floor: 0xx (ground), 1xx (1st), 2xx (2nd).'),
                _Bullet(
                    'After finding the floor in Search, switch to Floors and zoom into that area.'),
                _Bullet(
                    'For first-time visitors, open Map and start navigation from your current location.'),
                _Bullet('Use dark mode for better visibility in low light.'),
              ],
            ),

            const SizedBox(height: 12),

            _SectionCard(
              title: 'Notes',
              icon: Icons.info_outline,
              children: const [
                _Bullet(
                    'Indoor maps are static images (no GPS tracking indoors).'),
                _Bullet(
                    'Outdoor navigation is handled by Google Maps via the Open button.'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonalIcon(
      onPressed: onTap,
      icon: Icon(icon),
      label: Text(label),
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Icon(icon, color: scheme.secondary),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('•  ', style: TextStyle(color: scheme.secondary, fontSize: 18)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
