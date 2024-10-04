import 'package:flutter/material.dart';

class PredictTradeOptionsCard extends StatelessWidget {
  const PredictTradeOptionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2), // Reduced margin for compactness
      padding: const EdgeInsets.all(12), // Increased padding for inner content
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // Background color for the entire card set to #F5F5F5
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section with Background Color #F5F5F5
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Predict & Trade in Options',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'VIEW ALL',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 0),
          // NIFTY Section with tilted bottom edge
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 25),                decoration: BoxDecoration(
                  color: const Color(0xFF702C2C),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/bearish.png', height: 18), // Icon using asset path with specified size
                        const SizedBox(width: 8),
                        const Text(
                          'NIFTY 35,618.45',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '-960.00 (2.54%)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: CustomClipPath(), // Use the custom clipper
                  child: Container(
                    height: 10,
                    color: const Color(0xFF702C2C),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 0),
          // Section from "Bullish" to "6400 users traded" with Background Color #FFFFFF
          ClipRRect(
            borderRadius: BorderRadius.circular(20), // Set the radius for all corners
            child: Container(
              color: const Color(0xFFFFFFFF), // Background color set to white
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12), // Increased padding for better spacing
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildToggleButton('Bullish', isActive: true),
                      const SizedBox(width: 8),
                      _buildToggleButton('Bearish', isActive: false),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Recommended Options Strategies
                  const Text(
                    'Recommended Options Strategies',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildStrategyCard(
                          profit: '₹5,140',
                          description: 'NIFTY 29SEP 17500 CE',
                          funds: '₹16,501',
                          recommended: true,
                        ),
                        const SizedBox(width: 10),
                        _buildStrategyCard(
                          profit: '₹5,140',
                          description: 'NIFTY 29SEP 17500 CE',
                          funds: '₹16,501',
                          recommended: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Users Traded Section
                  Row(
                    children: [
                      Icon(Icons.people, color: Colors.blue, size: 18),
                      const SizedBox(width: 5),
                      const Text(
                        '6400 users traded',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  // Helper method for toggle buttons
  Widget _buildToggleButton(String title, {required bool isActive}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFBEEBFF) : Colors.white, // Background color or white when inactive
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFBEEBFF), // Border color
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: isActive ? Colors.blue : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Helper method for strategy cards
  Widget _buildStrategyCard({
    required String profit,
    required String description,
    required String funds,
    required bool recommended,
  }) {
    return Container(
      width: 150, // Ensure both cards have the same width
      padding: const EdgeInsets.all(12), // Adjusted padding for uniform size
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: recommended ? Colors.blue : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Max Profit',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            profit,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Required Funds',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            funds,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (recommended)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'RECOMMENDED',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Custom Clipper for tilted bottom edge
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height - 10); // Creates the tilted effect
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
