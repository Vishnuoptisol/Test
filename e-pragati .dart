```dart
import 'package:flutter/material.dart';

class EPragati extends StatefulWidget {
  const EPragati({Key? key}) : super(key: key);

  @override
  State<EPragati> createState() => _EPragatiState();
}

class _EPragatiState extends State<EPragati> {
  // Selected tab index
  int _selectedTabIndex = 0;

  // List of work items to display
  final List<String> workItems = [
    'Others (Controlled)',
    'MS Pipeline Work',
    'Pipeline Allied Works',
    'Boundary Wall & Approach Road',
    'Consumables',
    'Mobilisation',
    'Survey, Soil Investigation & Design',
    'Intake',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1A5A),
        elevation: 0,
        title: const Text(
          'Daily Progress Entry',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate back
          },
        ),
        leadingWidth: 40,
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          // Tab switcher
          Container(
            margin: const EdgeInsets.all(16),
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                _buildTab("WBS", 0),
                _buildTab("Pending", 1),
                _buildTab("Upcoming", 2),
              ],
            ),
          ),
          
          // Project info card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF0A1A5A), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.blue[800],
                  size: 24,
                ),
                const SizedBox(width: 16),
                const Text(
                  'LE23M219 - Sahibganj- RWSS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          // Search bar
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Work items list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: workItems.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return _buildWorkItem(workItems[index]);
              },
            ),
          ),
          
          // Home indicator
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 134,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ],
      ),
    );
  }

  // Build tab widget
  Widget _buildTab(String text, int index) {
    bool isSelected = _selectedTabIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0A1A5A) : Colors.transparent,
            borderRadius: BorderRadius.circular(28),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // Build work item widget
  Widget _buildWorkItem(String title) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        onTap: () {
          // Navigate to detail page
        },
      ),
    );
  }
}
```