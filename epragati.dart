import 'package:flutter/material.dart';

class epragati extends StatefulWidget {
  @override
  _EpragatiState createState() => _EpragatiState();
}

class _EpragatiState extends State<epragati> {
  int _selectedTabIndex = 0;
  final _searchController = TextEditingController();
  
  final List<String> _tabs = ["WBS", "Pending", "Upcoming"];
  final List<String> _workItems = [
    "Others (Controlled)",
    "MS Pipeline Work",
    "Pipeline Allied Works",
    "Boundary Wall & Approach Road",
    "Consumables",
    "Mobilisation",
    "Survey, Soil Investigation & Design",
    "Intake"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          _buildAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildTabBar(),
                  const SizedBox(height: 16),
                  _buildProjectInfoCard(),
                  const SizedBox(height: 16),
                  _buildSearchField(),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _buildWorkItemsList(),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomIndicator(),
        ],
      ),
    );
  }
  
  Widget _buildAppBar() {
    return Container(
      color: Color(0xFF0D1F5A),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.white),
            ),
            SizedBox(width: 16),
            Text(
              'Back',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Daily Progress Entry',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: List.generate(
          _tabs.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: _selectedTabIndex == index ? Color(0xFF0D1F5A) : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    _tabs[index],
                    style: TextStyle(
                      color: _selectedTabIndex == index ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Widget _buildProjectInfoCard() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF0D1F5A), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Icon(
            Icons.info,
            color: Color(0xFF0D1F5A),
            size: 24,
          ),
          SizedBox(width: 16),
          Text(
            'LE23M219 - Sahibganj- RWSS',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }
  
  Widget _buildWorkItemsList() {
    return ListView.builder(
      itemCount: _workItems.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return _buildWorkItemTile(_workItems[index]);
      },
    );
  }
  
  Widget _buildWorkItemTile(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }
  
  Widget _buildBottomIndicator() {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom > 0
            ? MediaQuery.of(context).padding.bottom
            : 16,
      ),
      alignment: Alignment.center,
      child: Container(
        width: 40,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}