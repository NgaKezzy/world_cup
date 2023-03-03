import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/first_page/view/question_show_notification_screen.dart';
import 'package:worldcup_app/models/codeCountry.dart';
import 'package:worldcup_app/services/api/info_api.dart';
import 'package:worldcup_app/services/repository/info_repo.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class ImportDetailsController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  RxString numberCode = phoneCode[0].obs;
  RxString country = countryList[0].obs;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();
  final TextEditingController _controllerRegion = TextEditingController();

  TextEditingController get controllerFirstName => _controllerFirstName;
  TextEditingController get controllerLastName => _controllerLastName;
  TextEditingController get controllerEmail => _controllerEmail;
  TextEditingController get controllerNumber => _controllerNumber;
  TextEditingController get controllerRegion => _controllerRegion;
  get formKey => _formKey;

  final InfoRepo _infoRepo = InfoRepo();

  String? isValidEmail(String? value) {
    if (value == null) return 'Email không được để trống';
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(value) ? null : 'Định dạng nhập vào không đúng';
  }

  void onChange(String key, String value) {
    switch (key) {
      case 'number':
        numberCode.value = value;
        break;
      case 'country':
        country.value = value;
        break;
      default:
    }
  }

  String? isValidName(String? value) {
    if (value == null) return 'Tên không được để trống';
    final nameRegExp = RegExp(r"[a-zA-Z]");
    return nameRegExp.hasMatch(value) ? null : 'Định dạng nhập vào không đúng';
  }

  String? isValidNumber(String? value) {
    if (value == null) return 'Số điện thoại không được để trống';
    final nameRegExp = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
    return nameRegExp.hasMatch(value)
        ? null
        : 'Định dạng nhập vào không đúng với số điện thoại';
  }

  void submitInfo({isLoading = true}) async {
    if (_formKey.currentState!.validate()) {
      if (isLoading) _isLoading(true);
      final ipv4 = await Ipify.ipv4();
      var dataPost = await _infoRepo.postUser(
        firstName: _controllerFirstName.text,
        lastName: _controllerLastName.text,
        email: _controllerEmail.text,
        number: '${numberCode.value}' + _controllerNumber.text,
        address: '${_controllerRegion.text} ${country.value}',
        ip: ipv4,
      );
      print(dataPost);
      if (dataPost.error.isEmpty) {
        Get.offAllNamed(AppRoutes.home);
      }
      _isLoading(false);
    }
  }
}
