import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treximino_admin_app/src/shared/service/api_constant.dart';
import 'package:treximino_admin_app/src/shared/service/api_service.dart';
import 'package:treximino_admin_app/src/shared/service/network/netweork_exceptions.dart';

class AuthService extends APIService {
  Future<Map<String, dynamic>> login(
      {required String email, required String password}) async {
    try {
      final res = await post(
          endPoint: ApiConstant.login,
          body: {'email': email, 'password': password});
      return res;
    } on NetweorkExceptions catch (e) {
      throw NetweorkExceptions.handleError(error: e);
    }
  }
}

final authServiceProvider = Provider((ref) => AuthService());
