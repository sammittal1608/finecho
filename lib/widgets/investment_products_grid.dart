import 'package:flutter/material.dart';

class InvestmentProductsGrid extends StatelessWidget {
  const InvestmentProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Investment Products',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'VIEW ALL',
                  style: TextStyle(color: Colors.blue,fontSize: 12),

                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              InvestmentProductCard(iconPath: 'assets/options_strategy.png', title: 'Options strategy'),
              InvestmentProductCard(iconPath: 'assets/stock_basket.png', title: 'Stock Basket'),
              InvestmentProductCard(iconPath: 'assets/advisory.png', title: 'Advisory'),
              InvestmentProductCard(iconPath: 'assets/research_ideas.png', title: 'Research Ideas'),
              InvestmentProductCard(iconPath: 'assets/stocks.png', title: 'Stock/MF SIP'),
              InvestmentProductCard(iconPath: 'assets/index_view.png', title: 'Index View'),
            ],
          ),
        ),
      ],
    );
  }
}

class InvestmentProductCard extends StatelessWidget {
  final String iconPath;
  final String title;

  const InvestmentProductCard({
    Key? key,
    required this.iconPath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the cards
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 40),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
