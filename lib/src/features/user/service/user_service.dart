import 'dart:convert';

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
      final user = json.decode(response.body);
      return User.fromJson(user).data;
    } on NetweorkExceptions catch (e) {
      throw NetweorkExceptions.handleError(error: e);
    }
  }
}

final userServiceProvider = Provider((ref) => UserService());
