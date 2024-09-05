import 'package:flutter/material.dart';
import '../widgets/market_statistics.dart'; // Import Market Statistics widget
import '../widgets/OptionsStrategyCard.dart'; // Import Options Strategy Card widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Index to manage the selected tab in BottomNavigationBar

  // Function to handle tap on bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 2, 8, 2),
        children: [
          const SizedBox(height: 20),
          const MarketStatistics(), // Add MarketStatistics widget here
          const OptionsStrategyCard(), // Add OptionsStrategyCard widget here
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/logo_small.png',
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 3,
            child: _buildSearchBar(),
          ),
          _buildIconButton('assets/mic.png', () {}),
          _buildIconButton('assets/wallet.png', () {}),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
              radius: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'Search scripts',
          hintStyle: TextStyle(color: Colors.grey[600]),
          suffixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
      ),
    );
  }

  Widget _buildIconButton(String assetPath, VoidCallback onPressed) {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: Image.asset(assetPath, width: 20, height: 20),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: onPressed,
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'Watchlist'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Portfolio'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Trades'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent,
      onTap: _onItemTapped,
    );
  }
}
