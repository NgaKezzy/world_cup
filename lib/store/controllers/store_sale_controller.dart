import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class StoreSaleController extends GetxController {
  RxBool isLoading = true.obs;
  String pathImage = '';
  bool enableShop = true;
  Future<void> getConfigStore() async {
    final collectionConfig = FirebaseFirestore.instance.collection('config');
    final data = await collectionConfig.get();
    if (data.docs.isNotEmpty) {
      final instanceFireStorage = FirebaseStorage.instance.ref();
      var pathString = await instanceFireStorage
          .child(data.docs[0]['sale_image'])
          .getDownloadURL();
      pathImage = pathString;
      enableShop = data.docs[0]['enableShop'];
    }
    isLoading(false);
  }

  @override
  void onReady() {
    getConfigStore();
    super.onReady();
  }
}
