import 'dart:convert';
import 'dart:io';

import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/services/api/info_api.dart';

class InfoRepo {
  InfoApi infoApi = InfoApi();

  // Hàm khởi tạo chung
  Future<Reponse<T>> postDataRepo<T>(
      {required Map<String, dynamic> params, Function? convertFromJson}) async {
    Reponse<T> responseData;
    T fixtures;

    var dataRawDecode;
    try {
      var rawFixtures = await infoApi.postRawData(params: params);
      if (rawFixtures.statusCode == 200) {
        dataRawDecode = jsonDecode(rawFixtures.body);
        if (convertFromJson != null) {
          try {
            fixtures = convertFromJson(dataRawDecode);
          } catch (e) {
            fixtures = convertFromJson(dataRawDecode[0]);
          }
        } else {
          fixtures = dataRawDecode;
        }

        responseData = Reponse(
          error: '',
          dataResponse: fixtures,
        );
      } else {
        responseData = Reponse(
          error: 'Lỗi ${rawFixtures.statusCode}',
        );
      }
    } on HandshakeException catch (e) {
      responseData = Reponse(
        error: 'Lỗi không có kết nối',
      );
    } catch (e) {
      if (dataRawDecode.runtimeType == Map && dataRawDecode?['error'] != null) {
        responseData = Reponse(
          error: dataRawDecode['message'],
        );
      } else {
        responseData = Reponse(
          error: 'Lỗi $e',
        );
        print('Lỗi $e');
      }
    }
    return responseData;
  }

  Future<Reponse<Map>> postUser({
    required String firstName,
    required String lastName,
    required String email,
    String address = '',
    String ip = '',
    required String number,
  }) async {
    Map<String, dynamic> params = {
      "name": firstName,
      "email": email,
      "phoneNumber": number,
      "address": address,
      "firstName": firstName,
      "lastName": lastName,
      "ip": ip,
    };
    var response = await postDataRepo<Map>(
      params: params,
    );
    return response;
  }
}
