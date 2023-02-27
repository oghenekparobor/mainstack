import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/util/validator.dart';
import 'package:mainstack/modules/editor/data/model/audio/audio_element.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/data/model/link/link.dart';
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
import 'package:provider/provider.dart';

final es = Provider.of<ElementNotifer>(
  navKey.currentContext!,
  listen: false,
);

class ElementNotifer with ChangeNotifier {
  final _elements = <EditorElements>[];

  List<EditorElements> get elements => _elements;

  void addElement(EditorElements elements) {
    _elements.add(elements);

    notifyListeners();
  }

  void removeElement(id) {
    _elements.removeWhere((e) => (e as dynamic).id == id);

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

  // Links
  final _links = <LinkModel>[
    LinkModel(
      id: uuid.v1(),
      link: '',
      position: 0,
      title: '',
    ),
  ];

  List<LinkModel> get links => _links;

  void addLink() {
    _links.add(LinkModel(
      id: uuid.v1(),
      link: '',
      position: 0,
      title: '',
    ));

    notifyListeners();
  }

  void removeLinkField(id) {
    _links.removeWhere((e) => e.id == id);

    notifyListeners();
  }

  void editLink(List<LinkModel> lm) {
    _links.clear();
    _links.addAll(lm);

    notifyListeners();
  }

  bool validateLink() {
    int error = 0;

    if (_links.isEmpty) {
      return false;
    } else {
      if (_links.any((e) => e.link.isEmpty || e.title.isEmpty)) {
        error++;
        MyToast().show('Please ensure title or url is not empty');
      } else {
        if (_links.any((e) => !urlValidator(e.link))) {
          error++;
          MyToast().show(
            'Please ensure url is not valid (i.e starts with https or http)',
          );
        }
      }
    }

    return (error == 0);
  }

  void updateLink(var key, var value, id) {
    var item = _links.firstWhere((e) => e.id == id);
    var pos = _links.indexOf(item);

    var map = item.toJson();
    map.update(key, (_) => value);

    _links.removeAt(pos);
    _links.insert(pos, LinkModel.fromJson(map));
  }

  void addLinkToElements(String? edit) {
    if (edit != null) {
      var item = _elements.firstWhere(
        (e) => (e as LinkElementModel).id == edit,
      ) as LinkElementModel;
      int pos = _elements.indexOf(item);

      var map = item.toJson();

      var list = [];
      for (var element in _links) {
        list.add(element.toJson());
      }

      map.update('links', (value) => list);
      _elements.removeAt(pos);
      _elements.insert(pos, LinkElementModel.fromJson(map));

      notifyListeners();
    } else {
      addElement(LinkElementModel(id: uuid.v1(), links: [..._links]));

      _links.clear();
      addLink();
    }
  }

  void duplicateLinks(List<LinkModel> lm) {
    addElement(LinkElementModel(id: uuid.v1(), links: lm));
  }
}
