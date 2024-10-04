import 'package:flutter/material.dart';
import 'curved_navigation_bar_painter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: CurvedNavigationBarPainter(
              backgroundColor: Colors.white,
              curveHeight: 30,
            ),
          ),
        ),
        BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black.withOpacity(0.6),
          onTap: onTap,
          items: [
            BottomNavigationBarItem(icon: Image.asset('assets/home.png'), label: 'Home'),
            BottomNavigationBarItem(icon: Image.asset('assets/watchlist.png'), label: 'Watchlist'),
            BottomNavigationBarItem(
              icon: Opacity(opacity: 0.0, child: Icon(Icons.explore)), // Transparent icon for alignment
              label: 'Explore',
            ),
            BottomNavigationBarItem(icon: Image.asset('assets/portfolio.png'), label: 'Portfolio'),
            BottomNavigationBarItem(icon: Image.asset('assets/trades.png'), label: 'Trades'),
          ],
        ),
        Positioned(
          top: -30, // Adjust this value to control the icon position
          left: MediaQuery.of(context).size.width * 0.42,
          child: Container(
            height: 60,
            width: 60,

            child: Center(
              child: Image.asset(
                'assets/logo_small.png', // Use the provided logo
                width: 50,
                height: 45,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
