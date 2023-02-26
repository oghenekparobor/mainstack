import 'package:flutter/material.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/audio/audio_element.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/data/model/link/link_element.dart';
import 'package:mainstack/modules/editor/data/model/pdf/pdf_element.dart';
import 'package:mainstack/modules/editor/data/model/text/text_element.dart';
import 'package:mainstack/modules/editor/data/model/video/video_element.dart';
import 'package:mainstack/modules/editor/presentation/views/audio/audio_element.dart';
import 'package:mainstack/modules/editor/presentation/views/image/image_element.dart';
import 'package:mainstack/modules/editor/presentation/views/link/link_element.dart';
import 'package:mainstack/modules/editor/presentation/views/pdf/pdf_element.dart';
import 'package:mainstack/modules/editor/presentation/views/text/text_element.dart';
import 'package:mainstack/modules/editor/presentation/views/video/video_element.dart';

class ElementNotifer with ChangeNotifier {
  final _elements = <EditorElements>[];

  List<EditorElements> get elements => _elements;

  void addElement(EditorElements elements) {
    _elements.add(elements);

    notifyListeners();
  }

  Widget showElement(EditorElements element) {
    switch (element.runtimeType) {
      case LinkElementModel:
        return LinkElement(
          key: ValueKey('link_element_${(element as LinkElementModel).id}'),
          lem: element,
        );
      case TextElementModel:
        return TextElement(
          key: ValueKey('text_element_${(element as TextElementModel).id}'),
          tem: element,
        );
      case ImageElementModel:
        return ImageElement(
          key: ValueKey('image_element_${(element as ImageElementModel).id}'),
          iem: element,
        );
      case VideoElementModel:
        return VideoElement(
          key: ValueKey('video_element_${(element as VideoElementModel).id}'),
          vem: element,
        );
      case AudioElementModel:
        return AudioElement(
          key: ValueKey('audio_element_${(element as AudioElementModel).id}'),
          aem: element,
        );
      case PdfElementModel:
        return PDFElement(
          key: ValueKey('pdf_element_${(element as PdfElementModel).id}'),
          pem: element,
        );

      default:
        return const SizedBox();
    }
  }
}
