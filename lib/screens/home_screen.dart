import 'package:flutter/material.dart';
import '../widgets/market_statistics.dart';
import '../widgets/OptionStrategy/option_strategy_slider.dart';
import '../widgets/bottom_navigation/custom_bottom_navigation_bar.dart';
import '../widgets/portfolio_overview_card.dart';
import '../widgets/investment_products_grid.dart';
import '../widgets/predict_trade_options_card.dart';
import '../widgets/Trending_Stock_Baskets_Card.dart';
import '../widgets/invest_in_ipo_card.dart';
import '../widgets/research_idea_section/section.dart';
import '../widgets/subscription/subscription_offer.dart';
import '../widgets/subscription/subscription_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool isSubscribed = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: const Color(0xFFF5F5F5),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        children: [
          const SizedBox(height: 2),
          const MarketStatistics(),
          const OptionsStrategySlider(),
          const PortfolioOverviewCard(),
          const InvestmentProductsGrid(),
          const PredictTradeOptionsCard(),
          const TrendingStockBasketsSection(),
          const InvestInIPOCard(),
          const ResearchIdeaSection(),
          // isSubscribed ? const SubscriptionContent() : const SubscriptionOffer(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
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
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
      ),
    );
  }

  Widget _buildIconButton(String assetPath, VoidCallback onPressed) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Image.asset(assetPath, width: 20, height: 20),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
      ),
    );
  }
}
