import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/models/firebase/highlight.dart';
import 'package:worldcup_app/models/firebase/section.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class LatestNewsController extends GetxController {
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  List<HighLight> listNews = [];

  final args = Get.arguments;

  final instanceFireStore = FirebaseFirestore.instance;
  final instanceFireStorage = FirebaseStorage.instance.ref();

  void getNews() async {
    final newsCollection = instanceFireStore.collection(AppApi.news);
    late final listData;
    log(args.toString());
    if (args['team'].isNotEmpty) {
      listData = await newsCollection
          .where('lang',
              isEqualTo: LocalStorageService().getString('shortName'))
          .where('team', isEqualTo: args['team'].toLowerCase())
          .get();
    } else {
      listData = await newsCollection
          .where('lang',
              isEqualTo: LocalStorageService().getString('shortName'))
          .get();
    }
    for (var highLight in listData.docs) {
      var pathString =
          await instanceFireStorage.child(highLight['image']).getDownloadURL();
      var instanceNews = HighLight(
          description: highLight['description'],
          title: highLight['title'],
          videoId: '',
          imageUrl: pathString,
          type: highLight['type'],
          team: highLight['team'],
          section: listSectionsFromJson(highLight['section']),
          created: highLight['created']);
      listNews.add(instanceNews);
    }
    _isLoading(false);
  }

  @override
  void onInit() {
    getNews();
    super.onInit();
  }
}
