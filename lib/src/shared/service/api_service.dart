import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:treximino_admin_app/src/shared/service/api_constant.dart';
import 'package:treximino_admin_app/src/shared/service/network/netweork_exceptions.dart';

class APIService {
  Future<Map<String, dynamic>> get({required String endPoint, String? token}) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConstant.baseUrl}/$endPoint'),
        headers: {
          'Content-Type': 'Application/json',
          'Accept': 'Application/json',
          'Authorization': 'Bearer $token'
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      throw NetweorkExceptions.handleError(
        statusCode: response.statusCode,
        error: json.decode(response.body),
      );
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConstant.baseUrl}/$endPoint'),
        headers: {
          'Content-Type': 'Application/json',
          'Accept': 'Application/json',
          'Authorization': 'Bearer ${ApiConstant.token}'
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      throw NetweorkExceptions.handleError(
        statusCode: response.statusCode,
        error: json.decode(response.body),
      );
    } catch (e) {
      throw e;
    }
  }
}
