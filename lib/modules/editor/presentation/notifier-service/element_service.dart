import 'package:flutter/material.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/modules/editor/data/model/link/link_element.dart';
import 'package:mainstack/modules/editor/presentation/views/link/link_element.dart';

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

      default:
        return const SizedBox();
    }
  }
}
