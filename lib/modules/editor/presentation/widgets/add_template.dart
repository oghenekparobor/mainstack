import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/widgets/button/filled_button.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';

class AddTemplate extends StatelessWidget {
  const AddTemplate({
    super.key,
    required this.child,
    required this.label,
    this.onTap,
  });

  final String label;
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(label, style: theme.textTheme.displayMedium),
              const Spacer(),
              IconButton(
                onPressed: () => nav.pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const YSpacer(),
          Expanded(child: child),
          const YSpacer(value: 20),
          MyFilledButton(label: 'Save', fontSize: 16, onTap: onTap),
        ],
      ),
    );
  }
}
