import 'package:flutter/material.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/presentation/notifier-service/element_service.dart';
import 'package:mainstack/modules/editor/presentation/widgets/element_template.dart';

class ImageElement extends StatelessWidget {
  const ImageElement({
    super.key,
    required this.iem,
  });

  final ImageElementModel iem;

  @override
  Widget build(BuildContext context) {
    return ElementTemplate(
      label: 'Image',
      child: es.layout(iem),
    );
  }

  
}
