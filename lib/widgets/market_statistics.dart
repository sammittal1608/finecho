import 'package:flutter/material.dart';

class MarketStatistics extends StatefulWidget {
  const MarketStatistics({Key? key}) : super(key: key);

  @override
  _MarketStatisticsState createState() => _MarketStatisticsState();
}

class _MarketStatisticsState extends State<MarketStatistics> {
  int _selectedIndex = 0; // Manages the selected tab
  final Color customBackgroundColor = Color(0xFFBEEBFF); // Light blue color: #BEEBFF


  // List of tab names
  final List<String> _tabs = ['Indices', 'Commodity', 'Currency', 'Global Indices'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildScrollableCustomTabBar(), // Updated to use a scrollable custom tab bar
        _buildTabContent(),
        _buildEditIndicesButton(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Market Statistics',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text('VIEW ALL', style: TextStyle(color: Colors.blueAccent)),
          ),
        ],
      ),
    );
  }

  // Custom Scrollable Tab Bar
  Widget _buildScrollableCustomTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),

      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _tabs.map((tab) {
              int index = _tabs.indexOf(tab);
              bool isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  margin: EdgeInsets.symmetric(horizontal: 1, vertical: 4), // Adjusted for better spacing
                  decoration: BoxDecoration(
                    color: isSelected ? customBackgroundColor  : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    tab,
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),

                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  // Tab Content based on Selected Index
  Widget _buildTabContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: 150,
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            buildIndicesTab(),
            buildCommodityTab(),
            buildCurrencyTab(),
            buildGlobalIndicesTab(),
          ],
        ),
      ),
    );
  }

  Widget buildIndicesTab() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: buildMarketCard('Nifty 50', '19,278.00', '+43.35 (0.25%)', true)),
        SizedBox(width: 8),
        Expanded(child: buildMarketCard('Nifty Bank', '19,278.00', '+43.35 (0.25%)', true)),
      ],
    );
  }

  Widget buildCommodityTab() {
    return Center(child: Text('Commodity Data'));
  }

  Widget buildCurrencyTab() {
    return Center(child: Text('Currency Data'));
  }

  Widget buildGlobalIndicesTab() {
    return Center(child: Text('Global Indices Data'));
  }

  Widget buildMarketCard(String title, String value, String change, bool isPositive) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Image.asset(
                  'assets/bullish.png',
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              change,
              style: TextStyle(fontSize: 14, color: isPositive ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditIndicesButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          onPressed: () {},
          child: Text('EDIT INDICES', style: TextStyle(color: Colors.blueAccent)),
        ),
      ),
    );
  }
}
