import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treximino_admin_app/src/features/authentication/login/service/auth_service.dart';
import 'package:treximino_admin_app/src/shared/go_router/go_router.dart';
import 'package:treximino_admin_app/src/shared/go_router/route_constants.dart';

class LoginNotifier extends AsyncNotifier<Map<String, dynamic>> {
  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final response = await ref
          .read(authServiceProvider)
          .login(email: email, password: password);

      if (response['status'] == true) {
        ref.read(goRouter).go(RouteConstants.userPath);
      }
      return response;
    });
  }

  @override
  FutureOr<Map<String, dynamic>> build() {
    return {};
  }
}

final loginNotifierProvider =
    AsyncNotifierProvider<LoginNotifier, Map<String, dynamic>>(
        LoginNotifier.new);
