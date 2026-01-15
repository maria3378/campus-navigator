import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<AppSettings>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            value: settings.notificationsEnabled,
            onChanged: settings.setNotificationsEnabled,
            title: const Text('Enable Notifications'),
            subtitle: const Text('Receive updates and alerts'),
            secondary: const Icon(Icons.notifications_active),
          ),
          SwitchListTile(
            value: settings.darkMode,
            onChanged: settings.setDarkMode,
            title: const Text('Dark Mode'),
            subtitle: const Text('Toggle app theme'),
            secondary: const Icon(Icons.dark_mode),
          ),
          const Divider(height: 32),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('About App'),
            subtitle: Text('Centria Campus Navigator v1.0'),
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text('Contact Support'),
            subtitle: const Text('campus.navigator@centria.fi'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy Policy'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
