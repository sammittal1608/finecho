import 'package:flutter/material.dart';

class ResearchIdeaCard extends StatelessWidget {
  final String time;
  final String action;
  final String item;
  final String expiry;
  final String currentPrice;
  final String expectedProfit;
  final String targetPrice;
  final String stopLoss;
  final String margin;
  final bool isBuy;

  const ResearchIdeaCard({
    super.key,
    required this.time,
    required this.action,
    required this.item,
    required this.expiry,
    required this.currentPrice,
    required this.expectedProfit,
    required this.targetPrice,
    required this.stopLoss,
    required this.margin,
    required this.isBuy,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140, // Set a smaller width to fit 2.5 cards on the screen
      height: 280, // Set the fixed height for the card
      child: Card(
        margin: const EdgeInsets.only(right: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isBuy ? const Color(0xFF0D490D) : const Color(0xFF702C2C),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(80), // Creates the curve effect
                  bottomRight: Radius.circular(80), // Creates the curve effect
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$action ', // Action part in white
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: item, // Item part in white
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    expiry,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    currentPrice,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.greenAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Expected Profit ', // Title in gray
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFCCCCCC),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: expectedProfit, // Data in green
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF009B00),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          'Target price $targetPrice',
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Stop loss $stopLoss',
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Margin/lot $margin',
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Add trade functionality
                      },
                      child: const Text(
                        'TRADE NOW',
                        style: TextStyle(
                          color: Color(0xFF253B81),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
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
