import 'package:flutter/material.dart';

class OptionsStrategyCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OptionsStrategyCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0), // Adds margin around the card
      padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0, bottom: 5.0), // Adjusted padding to reduce bottom space
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
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8), // Spacing between title and description
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8), // Reduced spacing before the button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    side: BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    minimumSize: Size(0, 20),
                  ),
                  child: Text(
                    'View More',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF16182C),
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
                imagePath,

                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
