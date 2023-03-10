import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/core/util/element.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/core/util/validator.dart';
import 'package:mainstack/modules/editor/data/model/audio/audio.dart';
import 'package:mainstack/modules/editor/data/model/audio/audio_element.dart';
import 'package:mainstack/modules/editor/data/model/image/image.dart';
import 'package:mainstack/modules/editor/data/model/image/image_element.dart';
import 'package:mainstack/modules/editor/data/model/link/link.dart';
import 'package:mainstack/modules/editor/data/model/link/link_element.dart';
import 'package:mainstack/modules/editor/data/model/pdf/pdf.dart';
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

  // Images
  int selectedLayout = 0;

  List imgLayouts = [
    {
      'label': 'Single',
      'icon':
          'https://customercare.igloosoftware.com/.api2/api/v1/communities/10068556/previews/thumbnails/4fc20722-5368-e911-80d5-b82a72db46f2?width=680&height=680&crop=False',
    },
    {
      'label': 'Grid',
      'icon':
          'https://w7.pngwing.com/pngs/648/914/png-transparent-computer-icons-new-york-city-grid-view-%E5%92%96%E5%95%A1%E6%B5%B7%E6%8A%A5%E5%9B%BE%E7%89%87%E7%B4%A0%E6%9D%90-miscellaneous-text-rectangle-thumbnail.png',
    },
    {
      'label': 'Carousel',
      'icon':
          'https://www.pngkey.com/png/detail/224-2247480_carousel-photos-comments-carousel-icon-png.png',
    },
  ];
  final _images = <ImageModel>[
    ImageModel(
      id: uuid.v1(),
      link: null,
      position: 0,
      alt: null,
      caption: null,
      image: '',
    ),
  ];

  List<ImageModel> get images => _images;

  void addImage() {
    _images.add(ImageModel(
      id: uuid.v1(),
      link: null,
      position: (_links.length + 1),
      image: '',
      alt: null,
      caption: null,
    ));

    notifyListeners();
  }

  void removeImageField(id) {
    _images.removeWhere((e) => e.id == id);

    notifyListeners();
  }

  void editImage(List<ImageModel> im) {
    _images.clear();
    _images.addAll(im);

    notifyListeners();
  }

  bool imageHasHeader = false;
  String imageHeader = '';
  String imageDesc = '';

  bool validateImage() {
    if (imageHasHeader && imageHeader.isEmpty) {
      MyToast().show('Please ensure header is not empty');

      return false;
    }

    int error = 0;

    if (_images.isEmpty) {
      return false;
    } else {
      if (_images.any((e) => e.image.isEmpty)) {
        error++;
        MyToast().show('Please ensure image is not empty');
      }
    }

    return (error == 0);
  }

  void updateImage(var key, var value, id) {
    var item = _images.firstWhere((e) => e.id == id);
    var pos = _images.indexOf(item);

    var map = item.toJson();
    map.update(key, (_) => value);

    _images.removeAt(pos);
    _images.insert(pos, ImageModel.fromJson(map));
  }

  void addImageToElements(String? edit) {
    if (edit != null) {
      var item = _elements.firstWhere(
        (e) => (e as ImageElementModel).id == edit,
      ) as ImageElementModel;

      int pos = _elements.indexOf(item);

      var map = item.toJson();

      var list = [];
      for (var element in _images) {
        list.add(element.toJson());
      }

      map.update('images', (value) => list);
      map.update(
        'layout',
        (value) => imgLayouts[selectedLayout]['label'],
      );
      map.update('title', (value) => imageHeader);
      map.update('hasHeader', (value) => imageHasHeader);
      map.update('desc', (value) => imageDesc);

      _elements.removeAt(pos);
      _elements.insert(pos, ImageElementModel.fromJson(map));

      imageHasHeader = false;
      imageHeader = '';
      selectedLayout = 0;
      imageDesc = '';

      _images.clear();
      addImage();

      notifyListeners();
    } else {
      addElement(ImageElementModel(
        id: uuid.v1(),
        images: [..._images],
        layout: imgLayouts[selectedLayout]['label'],
        hasHeader: imageHasHeader,
        title: imageHeader,
        desc: imageDesc,
      ));

      imageHasHeader = false;
      imageHeader = '';
      selectedLayout = 0;
      imageDesc = '';

      _images.clear();
      addImage();
    }
  }

  void duplicateImage(ImageElementModel lm) {
    addElement(ImageElementModel(
      id: uuid.v1(),
      hasHeader: lm.hasHeader,
      layout: lm.layout,
      title: lm.title,
      images: lm.images,
      desc: lm.desc,
    ));
  }

  void rearrangeImages({
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

      var items = _images.removeAt(o);
      _images.insert(n, items);

      notifyListeners();
    }
  }

  // Audios
  int selectedAudioPlatform = 0;

  List audioPlatform = [
    {
      'label': 'Spotify',
      'icon':
          'https://www.freepnglogos.com/uploads/spotify-logo-png/spotify-icon-green-logo-8.png',
    },
    {
      'label': 'Soundcloud',
      'icon':
          'https://www.freepnglogos.com/uploads/soundcloud-logo-png/soundcloud-logo-soundcloud-saved-cash-infusion-kerry-trainor-becomes-ceo-deadline-7.png',
    },
    {
      'label': 'Apple Music',
      'icon':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Apple_Music_icon.svg/2048px-Apple_Music_icon.svg.png',
    },
    {
      'label': 'Youtube Music',
      'icon':
          'https://static.vecteezy.com/system/resources/previews/017/396/813/non_2x/youtube-music-icon-free-png.png',
    },
    {
      'label': 'Tidal',
      'icon':
          'https://www.pngitem.com/pimgs/m/133-1336160_tidal-icon-listen-on-tidal-logo-hd-png.png',
    }
  ];

  final _audios = <AudioModel>[
    AudioModel(
      id: uuid.v1(),
      link: '',
      position: 0,
    ),
  ];

  List<AudioModel> get audios => _audios;

  void addAudio() {
    _audios.add(AudioModel(
      id: uuid.v1(),
      link: '',
      position: (_links.length + 1),
    ));

    notifyListeners();
  }

  void removeAudioField(id) {
    _audios.removeWhere((e) => e.id == id);

    notifyListeners();
  }

  void editAudio(List<AudioModel> am) {
    _audios.clear();
    _audios.addAll(am);

    notifyListeners();
  }

  bool audioHasHeader = false;
  String audioHeader = '';

  bool validateAudio() {
    if (audioHasHeader && audioHeader.isEmpty) {
      MyToast().show('Please ensure link is not empty');

      return false;
    }

    int error = 0;

    if (_audios.isEmpty) {
      return false;
    } else {
      if (_audios.any((e) => e.link.isEmpty)) {
        error++;
        MyToast().show('Please ensure image is not empty');

        if (_audios.any((e) => !urlValidator(e.link))) {
          error++;
          MyToast().show('Please ensure link is valid');
        }
      }
    }

    return (error == 0);
  }

  void updateAudio(var key, var value, id) {
    var item = _audios.firstWhere((e) => e.id == id);
    var pos = _audios.indexOf(item);

    var map = item.toJson();
    map.update(key, (_) => value);

    _audios.removeAt(pos);
    _audios.insert(pos, AudioModel.fromJson(map));
  }

  void addAudioToElements(String? edit) {
    if (edit != null) {
      var item = _elements.firstWhere(
        (e) => (e as AudioElementModel).id == edit,
      ) as AudioElementModel;

      int pos = _elements.indexOf(item);

      var map = item.toJson();

      var list = [];
      for (var element in _audios) {
        list.add(element.toJson());
      }

      map.update('audios', (value) => list);
      // map.update(
      //   'layout',
      //   (value) => imgLayouts[selectedLayout]['label'],
      // );
      map.update('title', (value) => audioHeader);
      map.update('hasHeader', (value) => audioHasHeader);

      _elements.removeAt(pos);
      _elements.insert(pos, AudioElementModel.fromJson(map));

      audioHasHeader = false;
      audioHeader = '';
      selectedAudioPlatform = 0;

      _audios.clear();
      addAudio();

      notifyListeners();
    } else {
      addElement(AudioElementModel(
        id: uuid.v1(),
        audios: [..._audios],
        hasHeader: audioHasHeader,
        title: audioHeader,
        position: (_elements.length + 1),
      ));

      audioHasHeader = false;
      audioHeader = '';
      selectedAudioPlatform = 0;

      _audios.clear();
      addAudio();
    }
  }

  void duplicateAudio(AudioElementModel lm) {
    addElement(AudioElementModel(
      id: uuid.v1(),
      hasHeader: lm.hasHeader,
      title: lm.title,
      audios: lm.audios,
      position: (lm.position + 1),
    ));
  }

  void rearrangeAudios({
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

      var items = _audios.removeAt(o);
      _audios.insert(n, items);

      notifyListeners();
    }
  }

  // Pdfs
  final _pdfs = <PdfModel>[
    PdfModel(
      id: uuid.v1(),
      position: 0,
      file: '',
      title: '',
    ),
  ];

  List<PdfModel> get pdfs => _pdfs;

  void addPdf() {
    _pdfs.add(PdfModel(
      id: uuid.v1(),
      position: (_links.length + 1),
      file: '',
      title: '',
    ));

    notifyListeners();
  }

  void removePdfField(id) {
    _pdfs.removeWhere((e) => e.id == id);

    notifyListeners();
  }

  void editPdf(List<PdfModel> pm) {
    _pdfs.clear();
    _pdfs.addAll(pm);

    notifyListeners();
  }

  bool pdfHasHeader = false;
  String pdfHeader = '';

  bool validatePdf() {
    if (pdfHasHeader && pdfHeader.isEmpty) {
      MyToast().show('Please ensure header is not empty');

      return false;
    }

    int error = 0;

    if (_pdfs.isEmpty) {
      return false;
    } else {
      if (_pdfs.any((e) => e.file.isEmpty)) {
        error++;
        MyToast().show('Please ensure image is not empty');
      }
    }

    return (error == 0);
  }

  void updatePdf(var key, var value, id) {
    var item = _pdfs.firstWhere((e) => e.id == id);
    var pos = _pdfs.indexOf(item);

    var map = item.toJson();
    map.update(key, (_) => value);

    _pdfs.removeAt(pos);
    _pdfs.insert(pos, PdfModel.fromJson(map));
  }

  void addPdfToElements(String? edit) {
    if (edit != null) {
      var item = _elements.firstWhere(
        (e) => (e as PdfElementModel).id == edit,
      ) as PdfElementModel;

      int pos = _elements.indexOf(item);

      var map = item.toJson();

      var list = [];
      for (var element in _pdfs) {
        list.add(element.toJson());
      }

      map.update('pdfs', (value) => list);
      // map.update(
      //   'layout',
      //   (value) => imgLayouts[selectedLayout]['label'],
      // );
      map.update('content', (_) => pdfHeader);
      map.update('hasHeader', (_) => pdfHasHeader);

      _elements.removeAt(pos);
      _elements.insert(pos, PdfElementModel.fromJson(map));

      pdfHasHeader = false;
      pdfHeader = '';

      _pdfs.clear();
      addPdf();

      notifyListeners();
    } else {
      addElement(PdfElementModel(
        id: uuid.v1(),
        pdfs: [..._pdfs],
        hasHeader: pdfHasHeader,
        content: pdfHeader,
      ));

      pdfHasHeader = false;
      pdfHeader = '';

      _pdfs.clear();
      addPdf();
    }
  }

  void duplicatePdf(PdfElementModel lm) {
    addElement(PdfElementModel(
      id: uuid.v1(),
      hasHeader: lm.hasHeader,
      content: pdfHeader,
      pdfs: lm.pdfs,
    ));
  }

  void rearrangePdfs({
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

      var items = _pdfs.removeAt(o);
      _pdfs.insert(n, items);

      notifyListeners();
    }
  }

  void rearrangeElements({
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

      var items = _elements.removeAt(o);
      _elements.insert(n, items);

      notifyListeners();
    }
  }
}
