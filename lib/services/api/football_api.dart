import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:worldcup_app/config_app/app_api.dart';

class FootballApi {
  // Gọi đến api lấy danh sách lịch thi đấu và kết quả
  Future<http.Response> getRawData(
      {required Map<String, dynamic> params}) async {
    var url = Uri.https(AppApi.baseApi, '', params);
    log(url.toString());
    var response = await http.get(url);
    print(response);
    return response;
  }
}
