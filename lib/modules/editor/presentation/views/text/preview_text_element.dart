import 'package:flutter/material.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/modules/editor/data/model/text/text.dart';

class PreviewTextLink extends StatelessWidget {
  const PreviewTextLink({
    super.key,
    required this.tm,
  });

  final TextModel tm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          tm.header,
          style: theme.textTheme.displayLarge,
        ),
        const YSpacer(),
        Text(
          tm.body,
          style: theme.textTheme.bodyLarge,
        ),
      ],
    );
  }
}
