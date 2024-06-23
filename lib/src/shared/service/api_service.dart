import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:treximino_admin_app/src/shared/service/api_constant.dart';

class APIService {
  Future<http.Response> get({required String endPoint}) async {
    final httpPackageInfo =
        await http.get(Uri.parse('${ApiConstant.baseUrl}/$endPoint'), headers: {
      'Content-Type': 'Application/json',
      'Accept': 'Application/json',
      'Authorization': 'Bearer ${ApiConstant.token}'
    });
    return httpPackageInfo;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    final httpPackageInfo =
        await http.post(Uri.parse('${ApiConstant.baseUrl}/$endPoint'),
            headers: {
              'Content-Type': 'Application/json',
              'Accept': 'Application/json',
              'Authorization': 'Bearer ${ApiConstant.token}'
            },
            body: body);
    return json.decode(httpPackageInfo.body);
  }
}
