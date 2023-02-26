import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/modules/editor/presentation/widgets/image/image_tile.dart';

class PreviewImageCarousel extends StatelessWidget {
  const PreviewImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200.h,
      child: PageView(
        controller: PageController(viewportFraction: .85),
        children: [
          for (var i = 0; i < 3; i++) ImageTile(width: size.width),
        ],
      ),
    );
  }
}
