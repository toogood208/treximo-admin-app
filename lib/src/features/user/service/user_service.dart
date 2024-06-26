

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treximino_admin_app/src/features/user/model/user.dart';
import 'package:treximino_admin_app/src/shared/service/api_constant.dart';
import 'package:treximino_admin_app/src/shared/service/api_service.dart';
import 'package:treximino_admin_app/src/shared/service/network/netweork_exceptions.dart';

class UserService extends APIService {
  Future<List<UserData>> getAllUsers({String? query}) async {
    try {
      final response = await get(
          endPoint:
              '${ApiConstant.endPoint}${query != null ? '?search=$query' : ''}');

      return User.fromJson(response).data;
    } on NetweorkExceptions catch (e) {
      throw NetweorkExceptions.handleError(statusCode: 100,error: e);
    }
  }
}

final userServiceProvider = Provider((ref) => UserService());
