import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app_settings.dart';
import 'app/app_theme.dart';
import 'ui/floor_view.dart';
import 'ui/home_screen.dart';
import 'ui/map_view.dart';
import 'ui/search_screen.dart';
import 'ui/settings_screen.dart';

void main() => runApp(const CampusNavigatorApp());

class CampusNavigatorApp extends StatelessWidget {
  const CampusNavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppSettings(),
      child: Consumer<AppSettings>(
        builder: (context, settings, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Centria Campus Navigator',
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: settings.darkMode ? ThemeMode.dark : ThemeMode.light,
            home: const MainScreen(),
          );
        },
      ),
    );
  }
}

/// Root widget that holds bottom navigation
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(onNavigate: (i) => setState(() => index = i)), // 0
      const FloorView(), // 1
      const MapView(), // 2
      const SearchScreen(), // 3
      const SettingsScreen(), // 4
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.layers), label: 'Floors'),
          NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
