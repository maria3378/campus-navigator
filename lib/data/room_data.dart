enum RoomType {
  teaching,
  laboratory,
  workspace,
  simulation,
  dining,
  meeting,
  study,
  lab,
  library,
}

extension RoomTypeX on RoomType {
  String get label {
    switch (this) {
      case RoomType.teaching:
        return 'Teaching';
      case RoomType.laboratory:
        return 'Laboratory';
      case RoomType.workspace:
        return 'Workspace';
      case RoomType.simulation:
        return 'Simulation';
      case RoomType.dining:
        return 'Dining';
      case RoomType.meeting:
        return 'Meeting';
      case RoomType.study:
        return 'Study';
      case RoomType.lab:
        return 'Lab';
      case RoomType.library:
        return 'Library';
    }
  }
}

class Room {
  final String id;
  final String name;
  final int floor;
  final RoomType type;

  const Room({
    required this.id,
    required this.name,
    required this.floor,
    required this.type,
  });

  /// Used for fast search (id + name)
  String get searchKey => '${id.toLowerCase()} ${name.toLowerCase()}';
}

final List<Room> rooms = List.unmodifiable([
  // Floor 0
  Room(id: '004', name: 'Room 004', floor: 0, type: RoomType.teaching),
  Room(id: '007', name: 'Room 007', floor: 0, type: RoomType.teaching),
  Room(id: '014', name: 'Room 014', floor: 0, type: RoomType.teaching),
  Room(id: '014B', name: 'Room 014B', floor: 0, type: RoomType.teaching),
  Room(id: '019', name: 'Room 019', floor: 0, type: RoomType.teaching),
  Room(id: '020', name: 'Room 020', floor: 0, type: RoomType.teaching),
  Room(id: '021', name: 'Room 021', floor: 0, type: RoomType.teaching),
  Room(id: '021B', name: 'Room 021B', floor: 0, type: RoomType.teaching),
  Room(id: '022', name: 'Room 022', floor: 0, type: RoomType.teaching),
  Room(id: '023', name: 'Room 023', floor: 0, type: RoomType.teaching),
  Room(id: '033B', name: 'Room 033B', floor: 0, type: RoomType.laboratory),
  Room(id: '033E', name: 'Room 033E', floor: 0, type: RoomType.laboratory),
  Room(id: '033F', name: 'Room 033F', floor: 0, type: RoomType.laboratory),
  Room(id: '034', name: 'Room 034', floor: 0, type: RoomType.teaching),
  Room(id: '036', name: 'Room 036', floor: 0, type: RoomType.teaching),
  Room(id: '037', name: 'Room 037', floor: 0, type: RoomType.teaching),
  Room(id: '038', name: 'Room 038', floor: 0, type: RoomType.teaching),
  Room(id: '039', name: 'Room 039', floor: 0, type: RoomType.teaching),
  Room(id: '040', name: 'Room 040', floor: 0, type: RoomType.teaching),
  Room(id: '041', name: 'Room 041', floor: 0, type: RoomType.teaching),
  Room(id: '042', name: 'Room 042', floor: 0, type: RoomType.teaching),
  Room(id: '056', name: 'Room 056', floor: 0, type: RoomType.teaching),
  Room(id: '057', name: 'Room 057', floor: 0, type: RoomType.teaching),
  Room(id: '057B', name: 'Room 057B', floor: 0, type: RoomType.teaching),
  Room(id: '063', name: 'Room 063', floor: 0, type: RoomType.teaching),
  Room(id: '064', name: 'Room 064', floor: 0, type: RoomType.teaching),
  Room(id: '066', name: 'Room 066', floor: 0, type: RoomType.teaching),
  Room(id: '067', name: 'Room 067', floor: 0, type: RoomType.teaching),
  Room(id: '071A', name: 'Room 071A', floor: 0, type: RoomType.teaching),
  Room(id: '071B', name: 'Room 071B', floor: 0, type: RoomType.teaching),
  Room(id: '071C', name: 'Room 071C', floor: 0, type: RoomType.teaching),
  Room(id: '072', name: 'Room 072', floor: 0, type: RoomType.teaching),
  Room(id: '081', name: 'Room 081', floor: 0, type: RoomType.workspace),
  Room(id: '083', name: 'Room 083', floor: 0, type: RoomType.workspace),
  Room(id: '085', name: 'Room 085', floor: 0, type: RoomType.workspace),
  Room(id: '086', name: 'Room 086', floor: 0, type: RoomType.teaching),
  Room(id: '091', name: 'Room 091', floor: 0, type: RoomType.teaching),
  Room(id: '092', name: 'Room 092', floor: 0, type: RoomType.simulation),

  // Floor 1
  Room(id: '123', name: 'Campus Restaurant', floor: 1, type: RoomType.dining),
  Room(id: '124', name: 'Room 124', floor: 1, type: RoomType.teaching),
  Room(id: '126', name: 'Room 126', floor: 1, type: RoomType.teaching),
  Room(id: '130', name: 'Room 130', floor: 1, type: RoomType.workspace),
  Room(id: '131', name: 'Room 131', floor: 1, type: RoomType.workspace),
  Room(id: '132', name: 'Room 132', floor: 1, type: RoomType.workspace),
  Room(id: '133', name: 'Room 133', floor: 1, type: RoomType.workspace),
  Room(id: '134', name: 'Room 134', floor: 1, type: RoomType.workspace),
  Room(id: '136B', name: 'Room 136B', floor: 1, type: RoomType.workspace),
  Room(id: '138A', name: 'Room 138A', floor: 1, type: RoomType.workspace),
  Room(id: '138B', name: 'Room 138B', floor: 1, type: RoomType.workspace),
  Room(id: '140B', name: 'Room 140B', floor: 1, type: RoomType.workspace),
  Room(id: '146', name: 'Room 146', floor: 1, type: RoomType.workspace),
  Room(id: '147', name: 'Room 147', floor: 1, type: RoomType.workspace),
  Room(id: '148', name: 'Room 148', floor: 1, type: RoomType.workspace),
  Room(id: '152', name: 'Room 152', floor: 1, type: RoomType.teaching),
  Room(id: '153', name: 'Room 153', floor: 1, type: RoomType.teaching),
  Room(id: '154', name: 'Room 154', floor: 1, type: RoomType.teaching),
  Room(id: '154A', name: 'Room 154A', floor: 1, type: RoomType.teaching),
  Room(id: '155', name: 'Room 155', floor: 1, type: RoomType.teaching),
  Room(id: '156', name: 'Room 156', floor: 1, type: RoomType.teaching),
  Room(id: '157', name: 'Room 157', floor: 1, type: RoomType.teaching),
  Room(id: '158', name: 'Room 158', floor: 1, type: RoomType.meeting),
  Room(id: '159', name: 'Room 159', floor: 1, type: RoomType.meeting),

  // Floor 2
  Room(id: '202', name: 'Room 202', floor: 2, type: RoomType.meeting),
  Room(id: '203', name: 'Room 203', floor: 2, type: RoomType.meeting),
  Room(id: '204', name: 'Room 204', floor: 2, type: RoomType.meeting),
  Room(id: '205', name: 'Room 205', floor: 2, type: RoomType.meeting),
  Room(id: '206', name: 'Room 206', floor: 2, type: RoomType.workspace),
  Room(id: '211', name: 'Room 211', floor: 2, type: RoomType.workspace),
  Room(id: '214', name: 'Room 214', floor: 2, type: RoomType.workspace),
  Room(id: '216', name: 'Room 216', floor: 2, type: RoomType.workspace),
  Room(id: '220', name: 'Room 220', floor: 2, type: RoomType.workspace),
  Room(id: '233F', name: 'Room 233F', floor: 2, type: RoomType.workspace),
  Room(id: '237', name: 'Room 237', floor: 2, type: RoomType.workspace),
  Room(id: '238', name: 'Room 238', floor: 2, type: RoomType.workspace),
  Room(id: '238A', name: 'Room 238A', floor: 2, type: RoomType.workspace),
  Room(id: '240', name: 'Room 240', floor: 2, type: RoomType.teaching),
  Room(id: '244', name: 'Room 244', floor: 2, type: RoomType.workspace),
  Room(id: '250', name: 'Room 250', floor: 2, type: RoomType.study),
  Room(id: '250A', name: 'Room 250A', floor: 2, type: RoomType.study),
  Room(id: '251', name: 'Room 251', floor: 2, type: RoomType.study),
  Room(id: '252', name: 'Room 252', floor: 2, type: RoomType.teaching),
  Room(id: '252A', name: 'Room 252A', floor: 2, type: RoomType.teaching),
  Room(id: '253A', name: 'Room 253A', floor: 2, type: RoomType.teaching),
  Room(id: '253B', name: 'Room 253B', floor: 2, type: RoomType.teaching),
  Room(id: '254A', name: 'Room 254A', floor: 2, type: RoomType.teaching),
  Room(id: '254B', name: 'Room 254B', floor: 2, type: RoomType.teaching),
  Room(id: '255', name: 'Room 255', floor: 2, type: RoomType.teaching),
  Room(id: '256', name: 'Room 256', floor: 2, type: RoomType.teaching),
  Room(id: '257', name: 'Room 257', floor: 2, type: RoomType.teaching),
  Room(id: '258', name: 'Room 258', floor: 2, type: RoomType.teaching),
  Room(id: '259', name: 'Room 259', floor: 2, type: RoomType.lab),
  Room(
      id: 'Library', name: 'Centria Library', floor: 2, type: RoomType.library),
]);
