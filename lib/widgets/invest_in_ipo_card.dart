import 'package:flutter/material.dart';

class InvestInIPOCard extends StatelessWidget {
  const InvestInIPOCard({super.key});

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
                'Invest in IPO',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  // Add navigation to the full list of IPOs
                },
                child: const Text(
                  'VIEW ALL',
                  style: TextStyle(color: Color(0xFF6C63FF)), // Updated color
                ),
              ),
            ],
          ),
        ),
        IPOItemCard(
          companyName: 'Paytm',
          closingIn: 'Closes in 2 days',
          logoPath: 'assets/Paytm-Logo.png',
        ),
        IPOItemCard(
          companyName: 'Adani Power',
          closingIn: 'Closes in 6 days',
          logoPath: 'assets/adani-power-logo.png',
        ),
      ],
    );
  }
}

class IPOItemCard extends StatelessWidget {
  final String companyName;
  final String closingIn;
  final String logoPath;

  const IPOItemCard({
    super.key,
    required this.companyName,
    required this.closingIn,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300, width: 1.5),
              ),
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                logoPath,
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 12), // Spacing between logo and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    companyName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2), // Reduce space between lines
                  Text(
                    closingIn,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12), // Adjust space before "Apply Now"
            TextButton(
              onPressed: () {
                // Add IPO application functionality here
              },
              child: Row(
                children: [
                  const Text(
                    'APPLY NOW',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 4), // Space between text and arrow
                  Image.asset(
                    'assets/right-arrow.png', // Right-arrow icon
                    width: 10,
                    height: 10,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
