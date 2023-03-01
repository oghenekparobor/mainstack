import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/image_tile.dart';

class PreviewImageCarousel extends StatelessWidget {
  const PreviewImageCarousel({
    super.key,
    required this.iem,
  });

  final ImageElementModel iem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: ValueKey('image_element_${iem.id}'),
      width: double.infinity,
      height: 200.h,
      child: PageView(
        controller: PageController(viewportFraction: .85),
        children: [
          for (var i in iem.images) ImageTile(width: size.width, im: i),
        ],
      ),
    );
  }
}
