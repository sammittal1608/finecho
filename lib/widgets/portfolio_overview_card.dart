import 'package:flutter/material.dart';

class PortfolioOverviewCard extends StatefulWidget {
  const PortfolioOverviewCard({Key? key}) : super(key: key);

  @override
  _PortfolioOverviewCardState createState() => _PortfolioOverviewCardState();
}

class _PortfolioOverviewCardState extends State<PortfolioOverviewCard> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Reduced padding
      margin: const EdgeInsets.all(8.0), // Reduced margin
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Background color for the entire card
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Portfolio',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildTabButton('Overview', 0),
              _buildTabButton('Positions', 1),
            ],
          ),
          const SizedBox(height: 10),
          if (_selectedTabIndex == 0) _buildOverviewContent() else _buildPositionsContent(),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            color: _selectedTabIndex == index ? Colors.blue[100] : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: _selectedTabIndex == index ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewContent() {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white, // Internal container background color
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Text color for "Current"
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '₹2,00,45,504.90',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Text color for the amount
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total Profit',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green, // Color for profit text
                ),
              ),
              Text(
                '+45,504.825 (+0.15%)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Color for profit amount
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Today's Profit",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.green, // Color for today's profit text
                ),
              ),
              Text(
                '+5,504.825 (+0.15%)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Color for today's profit amount
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Invested',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black, // Text color for "Invested"
                ),
              ),
              Text(
                'Net Worth',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black, // Text color for "Net Worth"
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '1,00,45,504.90',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Amount color for "Invested"
                ),
              ),
              Text(
                '3,34,67,237.84',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Amount color for "Net Worth"
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPositionsContent() {
    // Add content for Positions tab here
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: const Text('Positions Content'),
    );
  }
}
