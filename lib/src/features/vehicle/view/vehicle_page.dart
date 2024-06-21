import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:treximino_admin_app/src/shared/go_router/route_constants.dart';

class VehiclePage extends StatefulWidget {
  const VehiclePage({super.key});

  @override
  State<VehiclePage> createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Manage your Rides'),
      // ),
      body: Center(
        child: ElevatedButton(
          child: const Text("add vehicles"),
          onPressed: () => context.go(RouteConstants.navigateToAddVehicle),
        ),
      ),
    );
  }
}
