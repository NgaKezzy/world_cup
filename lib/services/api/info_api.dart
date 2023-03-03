import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:worldcup_app/config_app/app_api.dart';

class InfoApi {
  Future<http.Response> postRawData(
      {required Map<String, dynamic> params}) async {
    var url = Uri.http(AppApi.baseApiInfo, AppApi.user);
    var response = await http.post(url, body: params);
    log(response.toString());
    return response;
  }
}
