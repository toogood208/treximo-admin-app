import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treximino_admin_app/src/features/authentication/service/auth_service.dart';
import 'package:treximino_admin_app/src/shared/go_router/go_router.dart';
import 'package:treximino_admin_app/src/shared/go_router/route_constants.dart';
import 'package:treximino_admin_app/src/shared/service/api_constant.dart';

class AuthenNotifier extends AsyncNotifier<Map<String, dynamic>> {
  Future<void> login({required String email, required String password}) async {
    try {
      state = const AsyncLoading();
      final response = await ref
          .read(authServiceProvider)
          .login(email: email, password: password);
      if (response['status'] == true) {
        getLoggedInUser(token: response['token']);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> getLoggedInUser({required String token}) async {
    try {
      state = const AsyncLoading();
      final response =
          await ref.read(authServiceProvider).loggedInUser(token: token);
      state = AsyncData(response);
      if (response['status'] == 'success') {
        ref.read(goRouter).go(RouteConstants.userPath);
      }
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  @override
  FutureOr<Map<String, dynamic>> build() {
    return ref.read(authServiceProvider).loggedInUser(token: ApiConstant.token);
  }
}

final authNotifierProvider =
    AsyncNotifierProvider<AuthenNotifier, Map<String, dynamic>>(
        AuthenNotifier.new);
