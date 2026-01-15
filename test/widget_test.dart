import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedFloor = 1;
  final TextEditingController _searchController = TextEditingController();

  final Map<int, String> floorImages = {
    0: 'assets/floor_0.png',
    1: 'assets/floor_1.png',
    2: 'assets/floor_2.png',
  };

  final Map<String, int> roomToFloorMap = {
    // (Paste full room mapping here)
    "004": 0, "007": 0, "014": 0, "014B": 0, "019": 0, "020": 0,
    "021": 0, "021B": 0, "022": 0, "023": 0, "033E": 0, "033F": 0,
    "034": 0, "036": 0, "037": 0, "038": 0, "039": 0, "040": 0,
    "041": 0, "042": 0, "056": 0, "057": 0, "057B": 0, "063": 0,
    "064": 0, "066": 0, "067": 0, "072": 0, "071A": 0, "071B": 0,
    "071C": 0, "081": 0, "083": 0, "085": 0, "086": 0, "091": 0,
    "092": 0,
    "123": 1, "124": 1, "126": 1, "130": 1, "131": 1, "132": 1,
    "133": 1, "134": 1, "136B": 1, "138A": 1, "138B": 1, "140B": 1,
    "146": 1, "147": 1, "148": 1, "152": 1, "153": 1, "154": 1,
    "154A": 1, "155": 1, "156": 1, "157": 1, "158": 1, "159": 1,
    "202": 2, "203": 2, "204": 2, "205": 2, "206": 2, "211": 2,
    "214": 2, "216": 2, "220": 2, "233": 2, "235": 2, "237": 2,
    "238": 2, "238A": 2, "240": 2, "244": 2, "250": 2, "250A": 2,
    "251": 2, "252": 2, "252A": 2, "253A": 2, "253B": 2, "254A": 2,
    "254B": 2, "255": 2, "256": 2, "257": 2, "258": 2, "259": 2,
  };

  void _searchRoom() {
    final query = _searchController.text.trim().toUpperCase();
    if (roomToFloorMap.containsKey(query)) {
      setState(() {
        selectedFloor = roomToFloorMap[query]!;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Showing room $query on floor $selectedFloor'),
          backgroundColor: Colors.blue.shade800,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Room not found'),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Base background color
      appBar: AppBar(
        title: const Text(
          'Centria Campus Navigator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        elevation: 3,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Search
            TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _searchRoom(),
              decoration: InputDecoration(
                hintText: 'Enter room number (e.g., 124, 092)',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.blue.shade50,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.blue.shade300),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // 🧭 Dropdown
            DropdownButtonFormField<int>(
              value: selectedFloor,
              decoration: InputDecoration(
                labelText: 'Select Floor',
                filled: true,
                fillColor: Colors.blue.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.blue.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.blue.shade800, width: 2),
                ),
              ),
              items: const [
                DropdownMenuItem(value: 0, child: Text('Ground Floor')),
                DropdownMenuItem(value: 1, child: Text('1st Floor')),
                DropdownMenuItem(value: 2, child: Text('2nd Floor')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => selectedFloor = value);
                }
              },
            ),
            const SizedBox(height: 16),

            // 🗺️ Map
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: InteractiveViewer(
                  panEnabled: true,
                  minScale: 0.5,
                  maxScale: 3.5,
                  child: Image.asset(floorImages[selectedFloor]!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
