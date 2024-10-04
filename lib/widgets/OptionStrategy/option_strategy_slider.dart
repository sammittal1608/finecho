import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'option_strategy_card.dart';

class OptionsStrategySlider extends StatefulWidget {
  const OptionsStrategySlider({Key? key}) : super(key: key);

  @override
  _OptionsStrategySliderState createState() => _OptionsStrategySliderState();
}

class _OptionsStrategySliderState extends State<OptionsStrategySlider> {
  final PageController _controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          color: Colors.transparent, // Make sure the container's background is transparent
          height: 180, // Reduced height for a shorter card
          child: PageView(
            controller: _controller,
            children: const [
              OptionsStrategyCard(
                title: 'Options Strategy 1',
                description: 'An Advanced Tool of Readymade Option Strategies',
                imagePath: 'assets/bull.png',
              ),
              OptionsStrategyCard(
                title: 'Options Strategy 2',
                description: 'Explore different strategies\nand find the best fit for you.',
                imagePath: 'assets/bull.png',
              ),
              OptionsStrategyCard(
                title: 'Options Strategy 3',
                description: 'Detailed analysis of options\nand their performance.',
                imagePath: 'assets/bull.png',
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _controller,
          count: 3,
          effect: CustomizableEffect(
            activeDotDecoration: DotDecoration(
              width: 22,
              height: 8,
              color: Color(0xFFBEEBFF),
              borderRadius: BorderRadius.circular(16),
            ),
            dotDecoration: DotDecoration(
              width: 8,
              height: 8,
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            spacing: 8,
          ),
        ),
      ],
    );
  }
}
