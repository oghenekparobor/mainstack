import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/util/validator.dart';
import 'package:mainstack/modules/editor/data/model/audio/audio_element.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/data/model/link/link.dart';
import 'package:mainstack/modules/editor/data/model/link/link_element.dart';
import 'package:mainstack/modules/editor/data/model/pdf/pdf_element.dart';
import 'package:mainstack/modules/editor/data/model/text/text.dart';
import 'package:mainstack/modules/editor/data/model/text/text_element.dart';
import 'package:mainstack/modules/editor/data/model/video/video.dart';
import 'package:mainstack/modules/editor/data/model/video/video_element.dart';
import 'package:mainstack/modules/editor/presentation/views/audio/audio_element.dart';
import 'package:mainstack/modules/editor/presentation/views/audio/preview_audio_element.dart';
import 'package:mainstack/modules/editor/presentation/views/image/image_element.dart';
import 'package:mainstack/modules/editor/presentation/views/image/preview_image_element_carousel.dart';
import 'package:mainstack/modules/editor/presentation/views/image/preview_image_element_grid.dart';
import 'package:mainstack/modules/editor/presentation/views/image/preview_image_element_single.dart';
import 'package:mainstack/modules/editor/presentation/views/link/link_element.dart';
import 'package:mainstack/modules/editor/presentation/views/link/preview_link_element.dart';
import 'package:mainstack/modules/editor/presentation/views/pdf/pdf_element.dart';
import 'package:mainstack/modules/editor/presentation/views/pdf/preview_pdf_element.dart';
import 'package:mainstack/modules/editor/presentation/views/text/preview_text_element.dart';
import 'package:mainstack/modules/editor/presentation/views/text/text_element.dart';
import 'package:mainstack/modules/editor/presentation/views/video/preview_video_element.dart';
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

  Widget layout(ImageElementModel iem) {
    switch (iem.layout.toLowerCase()) {
      case 'single':
        return PreviewImageSingle(iem: iem);
      case 'grid':
        return PreviewImageGrid(iem: iem);
      case 'carousel':
        return PreviewImageCarousel(iem: iem);
      default:
        return const SizedBox();
    }
  }

  Widget showPreview(EditorElements element) {
    switch (element.runtimeType) {
      case LinkElementModel:
        return PreviewLinkElement(
          key: ValueKey('link_element_${(element as LinkElementModel).id}'),
          lm: (element).links,
        );
      case TextElementModel:
        return PreviewTextLink(
          key: ValueKey('text_element_${(element as TextElementModel).id}'),
          tm: element.text,
        );
      case ImageElementModel:
        return layout((element as ImageElementModel));
      case VideoElementModel:
        return PreviewVideoElement(
          key: ValueKey('video_element_${(element as VideoElementModel).id}'),
          vem: element,
        );
      case PreviewAudioElement:
        return AudioElement(
          key: ValueKey('audio_element_${(element as AudioElementModel).id}'),
          aem: element,
        );
      case PreviewPdfElement:
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

  void reorderLinks(int old, int nw) {
    if (nw >= (_links.length + 1)) {
    } else {
      if (nw > old) nw -= 1;

      var items = _links.removeAt(old);
      _links.insert(nw, items);

      notifyListeners();
    }
  }

  // Text session
  var _textModel = TextModel(
    body: '',
    header: '',
    id: uuid.v1(),
  );

  TextModel get text => _textModel;

  void editText(TextModel tm) {
    _textModel = tm;

    notifyListeners();
  }

  bool validateText() {
    if (_textModel.header.isEmpty || _textModel.body.isEmpty) {
      MyToast().show('Please ensure to fill all fields');

      return false;
    } else {
      return true;
    }
  }

  void updateTextProps(var key, var value) {
    var map = _textModel.toJson();
    map.update(key, (_) => value);

    _textModel = TextModel.fromJson(map);
  }

  void addTextToElements(String? edit) {
    if (edit != null) {
      var item = _elements.firstWhere(
        (e) => (e as TextElementModel).id == edit,
      ) as TextElementModel;
      int pos = _elements.indexOf(item);

      var map = item.toJson();

      var n = item.text.toJson();
      n.update('header', (value) => _textModel.header);
      n.update('body', (value) => _textModel.body);

      map.update('text', (_) => n);

      _elements.removeAt(pos);
      _elements.insert(pos, TextElementModel.fromJson(map));

      notifyListeners();
    } else {
      addElement(TextElementModel(id: uuid.v1(), text: _textModel));
      _textModel = TextModel(
        body: '',
        header: '',
        id: uuid.v1(),
      );

      notifyListeners();
    }
  }

  void duplicateText(TextModel tm) {
    addElement(
      TextElementModel(
        id: uuid.v1(),
        text: TextModel(
          body: tm.body,
          header: tm.header,
          id: uuid.v1(),
        ),
      ),
    );

    notifyListeners();
  }

  // Video
  int videoPlatformSelected = 0;

  List vplatform = [
    {
      'label': 'Youtube',
      'icon':
          'https://www.freepnglogos.com/uploads/youtube-play-red-logo-png-transparent-background-6.png',
    },
    {
      'label': 'Vimeo',
      'icon':
          'https://cdn.freebiesupply.com/logos/large/2x/vimeo-icon-blue-logo-png-transparent.png',
    },
    {
      'label': 'Twitch',
      'icon': 'https://cdn-icons-png.flaticon.com/512/5968/5968819.png',
    }
  ];

  final _videos = <VideoModel>[
    VideoModel(
      id: uuid.v1(),
      link: '',
      position: 0,
    ),
  ];

  List<VideoModel> get videos => _videos;

  void addVideo() {
    _videos.add(VideoModel(
      id: uuid.v1(),
      link: '',
      position: (_links.length + 1),
    ));

    notifyListeners();
  }

  void removeVideoField(id) {
    _videos.removeWhere((e) => e.id == id);

    notifyListeners();
  }

  void editVideo(List<VideoModel> vm) {
    _videos.clear();
    _videos.addAll(vm);

    notifyListeners();
  }

  bool videoHasHeader = false;
  String videoHeader = '';

  bool validateVideo() {
    if (videoHasHeader && videoHeader.isEmpty) {
      MyToast().show('Please ensure header is not empty');

      return false;
    }

    int error = 0;

    if (_videos.isEmpty) {
      return false;
    } else {
      if (_videos.any((e) => e.link.isEmpty)) {
        error++;
        MyToast().show('Please ensure url is not empty');
      } else {
        if (_videos.any((e) => !urlValidator(e.link))) {
          error++;
          MyToast().show(
            'Please ensure url is not valid (i.e starts with https or http',
          );
        }
      }
    }

    return (error == 0);
  }

  void updateVideo(var key, var value, id) {
    var item = _videos.firstWhere((e) => e.id == id);
    var pos = _videos.indexOf(item);

    var map = item.toJson();
    map.update(key, (_) => value);

    _videos.removeAt(pos);
    _videos.insert(pos, VideoModel.fromJson(map));
  }

  void addVideoToElements(String? edit) {
    if (edit != null) {
      var item = _elements.firstWhere(
        (e) => (e as VideoElementModel).id == edit,
      ) as VideoElementModel;

      int pos = _elements.indexOf(item);

      var map = item.toJson();

      var list = [];
      for (var element in _videos) {
        list.add(element.toJson());
      }

      map.update('videos', (value) => list);
      map.update(
        'platform',
        (value) => vplatform[videoPlatformSelected]['label'],
      );
      map.update('title', (value) => videoHeader);
      map.update('hasHeader', (value) => videoHasHeader);

      _elements.removeAt(pos);
      _elements.insert(pos, VideoElementModel.fromJson(map));

      videoHasHeader = false;
      videoHeader = '';
      videoPlatformSelected = 0;

      _videos.clear();
      addVideo();

      notifyListeners();
    } else {
      addElement(VideoElementModel(
        id: uuid.v1(),
        videos: [..._videos],
        platform: vplatform[videoPlatformSelected]['label'],
        hasHeader: videoHasHeader,
        title: videoHeader,
      ));

      videoHasHeader = false;
      videoHeader = '';
      videoPlatformSelected = 0;

      _videos.clear();
      addVideo();
    }
  }

  void duplicatevideo(VideoElementModel lm) {
    addElement(VideoElementModel(
      id: uuid.v1(),
      hasHeader: lm.hasHeader,
      platform: lm.platform,
      title: lm.title,
      videos: lm.videos,
    ));
  }

  void rearrangeVideo({
    required int oldIndex,
    required int newIndex,
    required int lenthOfWidgets,
    required int top,
    required int bottom,
  }) {
    if (newIndex < top || newIndex >= (lenthOfWidgets + (top + bottom))) {
    } else {
      var o = (oldIndex - top);
      var n = (newIndex - top);

      if (n > o) n -= 1;

      var items = _videos.removeAt(o);
      _videos.insert(n, items);

      notifyListeners();
    }
  }
}
