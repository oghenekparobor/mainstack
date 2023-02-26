import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/config/theme/theme.dart';
import 'package:mainstack/core/util/dialog.dart';
import 'package:mainstack/core/widgets/spacer/yspacer.dart';
import 'package:mainstack/core/widgets/textfield/textfield.dart';
import 'package:mainstack/modules/editor/presentation/views/audio/add_audio_element.dart';
import 'package:mainstack/modules/editor/presentation/views/image/add_image_preview.dart';
import 'package:mainstack/modules/editor/presentation/views/link/add_link_element.dart';
import 'package:mainstack/modules/editor/presentation/views/pdf/add_pdf_element.dart';
import 'package:mainstack/modules/editor/presentation/views/text/add_text_element.dart';
import 'package:mainstack/modules/editor/presentation/views/video/add_video_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/add-element/add_element.dart';

class AddBlockElement extends StatelessWidget {
  const AddBlockElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                'Select block elements',
                style: theme.textTheme.displayMedium,
              ),
              const Spacer(),
              IconButton(
                onPressed: () => nav.pop(),
                icon: const Icon(Icons.close),
              ),
            ],
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
            child: ListView(
              physics: const ClampingScrollPhysics(),
              children: [
                Text(
                  'Basic Blocks',
                  style: theme.textTheme.titleSmall,
                ),
                const YSpacer(),
                AddElementTile(
                  icon: Icons.link_outlined,
                  subtitle: 'Add multiple link buttons',
                  title: 'Links',
                  onTap: () {
                    MyDialog().showDialog(const AddLinkElement());
                  },
                ),
                AddElementTile(
                  icon: Icons.text_fields_outlined,
                  subtitle: 'Add content, title & paragraph texts',
                  title: 'Text',
                  onTap: () {
                    MyDialog().showDialog(const AddTextElement());
                  },
                ),
                const AddElementTile(
                  icon: Icons.contact_mail_outlined,
                  subtitle: 'Setup mailing list, connect to mailchimp',
                  title: 'Mailing List',
                ),
                Text(
                  'Media',
                  style: theme.textTheme.titleSmall,
                ),
                const YSpacer(),
                AddElementTile(
                  icon: Icons.image,
                  subtitle: 'Add single, mulitple images in grid or carousel',
                  title: 'Image',
                  onTap: () {
                    MyDialog().showDialog(const AddImageElement());
                  },
                ),
                AddElementTile(
                  icon: Icons.video_collection_outlined,
                  subtitle: 'Get more views, add your youtube, vimeoink',
                  title: 'Video',
                  onTap: () {
                    MyDialog().showDialog(const AddVideoElement());
                  },
                ),
                AddElementTile(
                  icon: Icons.headphones_rounded,
                  subtitle:
                      'Get more listener, add your podcast or favorite music',
                  title: 'Audio',
                  onTap: () {
                    MyDialog().showDialog(const AddAudioElement());
                  },
                ),
                AddElementTile(
                  icon: Icons.picture_as_pdf,
                  subtitle: 'Share downloaded resource with your audience',
                  title: 'Pdf',
                  onTap: () {
                    MyDialog().showDialog(const AddPdfElement());
                  },
                ),
                Text(
                  'Collect Payments',
                  style: theme.textTheme.titleSmall,
                ),
                const YSpacer(),
                const AddElementTile(
                  icon: Icons.card_giftcard,
                  subtitle: 'Receive payment from followers globally',
                  title: 'Fan Love',
                ),
                const AddElementTile(
                  icon: Icons.coffee_outlined,
                  subtitle: 'Receive coffee from fans who love your work',
                  title: 'Buy me Coffee',
                ),
                const AddElementTile(
                  icon: Icons.local_florist,
                  subtitle: 'Receive payment from followers globally',
                  title: 'Send Me Flowers',
                ),
                Text(
                  'Business Tools',
                  style: theme.textTheme.titleSmall,
                ),
                const YSpacer(),
                const AddElementTile(
                  icon: Icons.store_outlined,
                  subtitle: 'Sell Digital item suh as e-books etc.',
                  title: 'Digital Shop',
                ),
                const AddElementTile(
                  icon: Icons.calendar_today_outlined,
                  subtitle: 'Create masterclass, event, seminars etc.',
                  title: 'Masterclass',
                ),
              ],
            ),
          ),
          const YSpacer(value: 20),
        ],
      ),
    );
  }
}
