import 'package:flutter/material.dart';

import '../data/room_data.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  final VoidCallback? onTap;

  const RoomCard({super.key, required this.room, this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: scheme.primary.withOpacity(0.12),
          foregroundColor: scheme.primary,
          child: Text(
            room.id,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
          ),
        ),
        title: Text(room.name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text('Floor ${room.floor} • ${room.type.label}'),
        trailing: Icon(Icons.chevron_right, color: scheme.secondary),
      ),
    );
  }
}
