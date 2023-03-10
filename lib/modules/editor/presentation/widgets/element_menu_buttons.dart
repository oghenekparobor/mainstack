import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElementMenuButtons extends StatelessWidget {
  const ElementMenuButtons({
    super.key,
    this.delete,
    this.duplicate,
    this.edit,
  });

  final VoidCallback? edit;
  final VoidCallback? duplicate;
  final VoidCallback? delete;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: .5,
              color: Colors.grey.shade300,
            ),
          ),
          child: IconButton(
            onPressed: edit,
            icon: const Icon(Icons.edit_outlined, color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: .5,
              color: Colors.grey.shade300,
            ),
          ),
          child: IconButton(
            onPressed: duplicate,
            icon: const Icon(Icons.copy_outlined, color: Colors.grey),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: .5,
              color: Colors.grey.shade300,
            ),
          ),
          child: IconButton(
            onPressed: delete,
            icon: const Icon(Icons.delete_outline, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
