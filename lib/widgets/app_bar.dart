import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  static const double _toolbarHeight = 80; // Constant for AppBar height
  static const double _iconSize = 20; // Constant for icon size
  static const String _logoPath = 'assets/logo_small.png';
  static const String _micPath = 'assets/mic.png';
  static const String _walletPath = 'assets/wallet.png';
  static const String _profilePath = 'assets/profile.png';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: _toolbarHeight,
      title: Row(
        children: [
          Image.asset(
            _logoPath,
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 3,
            child: Container(
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
            ),
          ),
          const SizedBox(width: 2),
          _buildIconButton(_micPath, 'Microphone'),
          const SizedBox(width: 2),
          _buildIconButton(_walletPath, 'Wallet'),
          const SizedBox(width: 2),
          CircleAvatar(
            backgroundImage: AssetImage(_profilePath),
            radius: 16,
          ),
        ],
      ),
    );
  }

  // Method to build icon buttons with tooltips
  Widget _buildIconButton(String assetPath, String tooltip) {
    return IconButton(
      icon: Image.asset(assetPath, width: _iconSize, height: _iconSize),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      tooltip: tooltip, // Tooltip for accessibility
      onPressed: () {}, // Define the action for each icon
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_toolbarHeight);
}
