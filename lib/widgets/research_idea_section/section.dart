import 'package:flutter/material.dart';
import 'card.dart'; // Import the card widget

class ResearchIdeaSection extends StatefulWidget {
  const ResearchIdeaSection({super.key});

  @override
  _ResearchIdeaSectionState createState() => _ResearchIdeaSectionState();
}

class _ResearchIdeaSectionState extends State<ResearchIdeaSection> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = [
    'All',
    'Intra Day',
    'Option',
    'Long Term',
    'Swift',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Research Ideas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Add navigation to the full list of Research Ideas
                },
                child: const Text(
                  'VIEW ALL',
                  style: TextStyle(color: Color(0xFF253B81)),
                ),
              ),
            ],
          ),
        ),
        _buildCustomTabBar(),
        _buildScrollableIdeas(),
        _buildRecommendedBySection(),
      ],
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color for the tab bar
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _tabs.map((tab) {
            final index = _tabs.indexOf(tab);
            final isSelected = index == _selectedTabIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTabIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFB3E5FC) : Colors.transparent, // Highlight color for the active tab
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  tab,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey[600],
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildScrollableIdeas() {
    return SizedBox(
      height: 280, // Match this with the card height
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        children: const [
          ResearchIdeaCard(
            time: '10:45 AM',
            action: 'SELL',
            item: 'CRUDEOIL',
            expiry: '22SEP 1657.00 CE',
            currentPrice: '1,403.05 (+4.5%)',
            expectedProfit: '+45%',
            targetPrice: '2100.00',
            stopLoss: '1800.50',
            margin: '231770.30',
            isBuy: false, // For SELL, it should be false
          ),
          ResearchIdeaCard(
            time: '10:45 AM',
            action: 'BUY',
            item: 'GOLD',
            expiry: '22SEP 1657.00 CE',
            currentPrice: '1,403.05 (+4.5%)',
            expectedProfit: '+56%',
            targetPrice: '2100.00',
            stopLoss: '1800.50',
            margin: '231770.30',
            isBuy: true, // For BUY, it should be true
          ),
          // More cards can be added here...
        ],
      ),
    );
  }

  Widget _buildRecommendedBySection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Research Recommended By',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFFCCCCCC), // Gray color for the title
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8), // Space between title and icons
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/groww.png'), // Replace with your asset image
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/kotak.png'), // Replace with your second image
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/hdfc.png'), // Replace with your third image
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 16,
                backgroundColor: const Color(0xFF253B81),
                child: Text(
                  '+10',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // Add functionality to view all recommendations
                },
                child: const Text('VIEW ALL', style: TextStyle(color: Color(0xFF253B81))),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
