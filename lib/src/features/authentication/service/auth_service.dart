
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treximino_admin_app/src/shared/service/api_constant.dart';
import 'package:treximino_admin_app/src/shared/service/api_service.dart';

class AuthService extends APIService {
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    try {
      final res = await post(
          endPoint: ApiConstant.login,
          body: {'email': email, 'password': password});
      return res;
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> loggedInUser({required String token}) async {
    try {
      final res = await get(endPoint: ApiConstant.loggedInUser, token: token);
      return res;
    } catch (e) {
      throw e;
    }
  }
}

final authServiceProvider = Provider((ref) => AuthService());
