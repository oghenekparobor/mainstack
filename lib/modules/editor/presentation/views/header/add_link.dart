import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/widgets/button/filled_button.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';

class AddLinks extends StatelessWidget {
  const AddLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Select Social Media Icons',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () => nav.pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Text(
            'Add 5 of your top social medias like twitter, facebook, instagram or linkedin.',
            style: theme.textTheme.titleSmall,
          ),
          const YSpacer(),
          MyTextField(
            title: '',
            focusNode: FocusNode(),
            radius: 30,
            prefix: const Icon(Icons.search, color: Colors.grey),
          ),
          const YSpacer(value: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var i = 0; i < 13; i++)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const SizedBox(
                        width: 24,
                        height: 24,
                        child: Placeholder(),
                      ),
                      title: Text(
                        'Lorem ipsum',
                        style: theme.textTheme.bodyMedium,
                      ),
                      trailing: Checkbox(
                        onChanged: (value) {},
                        value: true,
                        activeColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          const YSpacer(value: 20),
          MyFilledButton(
            label: 'Confirm',
            fontSize: 16,
            onTap: () {
              MyToast().show('Lorem ipsum is a dummy text');
            },
          ),
        ],
      ),
    );
  }
}
