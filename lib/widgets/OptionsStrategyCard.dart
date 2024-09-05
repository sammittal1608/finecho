import 'package:flutter/material.dart';

class OptionsStrategyCard extends StatelessWidget {
  const OptionsStrategyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0), // Adds margin around the card
      padding: const EdgeInsets.all(10.0), // Adds padding inside the card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded corners
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(190, 235, 255, 0.46), // #BEEBFF with 46% opacity
            Color.fromRGBO(203, 138, 12, 0.5),   // #CB8A0C with 50% opacity
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color with transparency
            spreadRadius: 2, // Spread radius of the shadow
            blurRadius: 10, // Blur radius of the shadow
            offset: Offset(0, 5), // Offset for the shadow
          ),
        ],
      ),
      child: Row(
        children: [
          // Text and Button Column (Left 50%)
          Expanded(
            flex: 1, // Takes up 50% of the available space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Options Strategy',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8), // Spacing between title and description
                Text(
                  'An Advanced Tool of Readymade\nOption Strategies & Charting',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16), // Spacing before the button
                ElevatedButton(
                  onPressed: () {}, // Add functionality for the button
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Matches the parent background
                    elevation: 0, // Removes shadow from the button
                    side: BorderSide(color: Colors.black, width: 1), // 1px black border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3), // 3px border radius
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Set vertical padding to 5px
                    minimumSize: Size(0, 20), // Adjust minimum size if needed
                  ),
                  child: Text(
                    'View More',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF16182C),
                      // Text color of the button
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Image of Bull (Right 50%)
          Expanded(
            flex: 1, // Takes up 50% of the available space
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/bull.png', // Replace with your bull image path
                width: 154,
                height: 102,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
