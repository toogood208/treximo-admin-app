import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treximino_admin_app/src/features/user/model/user.dart';
import 'package:treximino_admin_app/src/features/user/service/user_service.dart';

class UserNotifier extends AsyncNotifier<List<UserData>> {
  @override
  FutureOr<List<UserData>> build() async {
    return await _fetchAllUsers();
  }

  Future<List<UserData>> _fetchAllUsers([String? query]) async {
    try {
      final users = await ref.read(userServiceProvider).getAllUsers(query: query);
      return users;
    } catch (e) {
      throw AsyncError(e, StackTrace.current);
    }
  }

  Future<void> getAllUsers() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchAllUsers());
  }

  Future<void> searchItems(String query) async {
  //state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchAllUsers(query));
  }
}

final userNotifierProvider =
    AsyncNotifierProvider<UserNotifier, List<UserData>>(UserNotifier.new);
