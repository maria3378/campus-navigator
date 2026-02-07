import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app/app_settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String supportEmail = 'centriacampusnavigator@gmail.com';

  Future<void> _emailSupport(BuildContext context) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: supportEmail,
      queryParameters: {
        'subject': 'Centria Campus Navigator Support',
      },
    );

    final ok = await launchUrl(
      emailUri,
      mode: LaunchMode.externalApplication,
    );

    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open email app')),
      );
    }
  }

  Future<void> _copyEmail(BuildContext context) async {
    await Clipboard.setData(const ClipboardData(text: supportEmail));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Email copied')),
    );
  }

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

          // ✅ Click to email, long-press to copy
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text('Contact Support'),
            subtitle: const Text(supportEmail),
            trailing: const Icon(Icons.open_in_new),
            onTap: () => _emailSupport(context),
            onLongPress: () => _copyEmail(context),
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
