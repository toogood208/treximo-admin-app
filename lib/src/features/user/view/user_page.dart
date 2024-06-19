import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:treximino_admin_app/src/shared/go_router/route_constants.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UsersState();
}

class _UsersState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UserPage"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('add UserPage'),
          onPressed: () {
            context.go(RouteConstants.navigateToAddUser);
          },
        ),
      ),
    );
  }
}
