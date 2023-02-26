import 'package:flutter/material.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class PreviewTextLink extends StatelessWidget {
  const PreviewTextLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Header',
          style: theme.textTheme.displayLarge,
        ),
        const YSpacer(),
        Text(
          'Lorem ipsum is a dummy text',
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
