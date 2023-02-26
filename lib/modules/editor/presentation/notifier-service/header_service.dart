import 'package:flutter/material.dart';
import 'package:mainstack/app/app.dart';
import 'package:mainstack/core/util/toast.dart';
import 'package:mainstack/modules/editor/data/model/header/header.dart';
import 'package:mainstack/modules/editor/data/model/header/social-media/social_media.dart';
import 'package:provider/provider.dart';

final hn = Provider.of<HeaderNotifer>(
  navKey.currentContext!,
  listen: false,
);

class HeaderNotifer with ChangeNotifier {
  HeaderModel? header;
  String? banner;
  String? profile;

  void prePopulateHeader() {
    header = HeaderModel(
      applicableTitle: const [],
      bannerImage: null,
      bio: '',
      displayName: 'Oghenekparobor Eminokanju',
      displayPicture:
          'https://lh3.googleusercontent.com/a/AGNmyxbu9wU6LZlWmMOkKR5KiH9oN35OydQQaR0g47epIQ=s96-c',
      id: uuid.v1(),
      socialMedia: const [],
    );

    notifyListeners();
  }

  void addAppTitle(String title) {
    var map = header!.toJson();

    var titles = [...header!.applicableTitle];
    titles.add(title);

    map.update('applicableTitle', (_) => titles);

    header = HeaderModel.fromJson(map);

    notifyListeners();
  }

  void removeAppTitle(int i) {
    var map = header!.toJson();

    var titles = [...header!.applicableTitle];
    titles.removeAt(i);

    map.update('applicableTitle', (_) => titles);

    header = HeaderModel.fromJson(map);
    notifyListeners();
  }

  void updateHeader(var key, var value) {
    var map = header!.toJson();

    map.update(key, (_) => value);

    var socials = [...header!.socialMedia];
    var list = [];
    for (var element in socials) {
      list.add(element.toJson());
    }

    map.update('socialMedia', (_) => list);

    header = HeaderModel.fromJson(map);

    notifyListeners();
  }

  bool haveSocials(soc) {
    return (header!.socialMedia.any((e) => e.name == soc));
  }

  void addRemoveSocials(soc) {
    var map = header!.toJson();
    var socials = [...header!.socialMedia];

    if (socials.any((e) => e.name == soc['label'])) {
      socials.removeWhere((e) => e.name == soc['label']);
    } else {
      socials.add(SocialMediaModel(
        icon: soc['icon'],
        id: uuid.v1(),
        link: '',
        name: soc['label'],
        position: (header?.socialMedia == null || header!.socialMedia.isEmpty)
            ? 0
            : (header!.socialMedia.length + 1),
      ));
    }

    var list = [];
    for (var element in socials) {
      list.add(element.toJson());
    }

    map.update('socialMedia', (_) => list);

    header = HeaderModel.fromJson(map);
    notifyListeners();
  }

  void removeSocialMedia(soc) {
    var map = header!.toJson();
    var socials = [...header!.socialMedia];

    socials.removeWhere((e) => e.id == soc);

    var list = [];
    for (var element in socials) {
      list.add(element.toJson());
    }

    map.update('socialMedia', (_) => list);

    header = HeaderModel.fromJson(map);
    notifyListeners();
  }

  void rearrangeSocialMedia(int old, int nw) {
    if (nw < 10 || nw >= (header!.socialMedia.length + 12)) {
    } else {
      var o = (old - 10);
      var n = (nw - 10);

      var map = header!.toJson();
      var socials = [...header!.socialMedia];

      if (n > o) n -= 1;

      var items = socials.removeAt(o);
      socials.insert(n, items);

      var list = [];
      for (var element in socials) {
        list.add(element.toJson());
      }

      map.update('socialMedia', (_) => list);

      header = HeaderModel.fromJson(map);
      notifyListeners();
    }
  }

  bool validateSocialMedia() {
    if (header!.socialMedia.isEmpty) {
      return true;
    } else {
      var error = 0;

      if (header!.socialMedia.any((e) => e.link.isEmpty)) {
        error++;
        var item = header!.socialMedia.firstWhere((e) => e.link.isEmpty);

        MyToast().show('Fill in your ${item.name} details');
      }

      return (error == 0);
    }
  }

  void updateSocialMediaLink(var id, String username) {
    var map = header!.toJson();
    var socials = [...header!.socialMedia];

    var item = socials.firstWhere((e) => e.id == id);
    int pos = socials.indexOf(item);
    socials.removeAt(pos);

    var itepMap = (item.toJson());
    itepMap.update('link', (_) => username);
    socials.insert(pos, SocialMediaModel.fromJson(itepMap));

    var list = [];
    for (var element in socials) {
      list.add(element.toJson());
    }

    map.update('socialMedia', (_) => list);

    header = HeaderModel.fromJson(map);
  }
}
