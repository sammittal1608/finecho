import 'package:flutter/material.dart';
import 'subscription_content/tg_and_s.dart';
import 'subscription_content/tg_and_s_options.dart';
import 'subscription_content/signals.dart';
import 'subscription_content/strategy.dart';

class SubscriptionContent extends StatelessWidget {
  const SubscriptionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        // These are your four components that will be displayed
        TgAndS(),
        TgAndSOptions(),
        Signals(),
        Strategy(),
      ],
    );
  }
}
