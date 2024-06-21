import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:treximino_admin_app/src/features/user/view/add_users_page.dart';
import 'package:treximino_admin_app/src/features/user/view/user_page.dart';
import 'package:treximino_admin_app/src/features/vehicle/view/add_vehicle_page.dart';
import 'package:treximino_admin_app/src/features/vehicle/view/vehicle_page.dart';
import 'package:treximino_admin_app/src/shared/go_router/route_constants.dart';
import 'package:treximino_admin_app/src/shared/widgets/custom_app_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellUsersNavigatorKey = GlobalKey<NavigatorState>();
final _shellVehiclesNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
    initialLocation: RouteConstants.vehiclePath,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNextedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
                navigatorKey: _shellVehiclesNavigatorKey,
                routes: [
                  GoRoute(
                      path: RouteConstants.vehiclePath,
                      pageBuilder: (context, state) => const NoTransitionPage(
                            child: VehiclePage(),
                          ),
                      routes: [
                        GoRoute(
                            path: RouteConstants.addVehiclePath,
                            pageBuilder: (context, state) =>
                                const NoTransitionPage(child: AddVehiclePage()))
                      ])
                ]),
            StatefulShellBranch(navigatorKey: _shellUsersNavigatorKey, routes: [
              GoRoute(
                  path: RouteConstants.userPath,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: UserPage()),
                  routes: [
                    GoRoute(
                      path: RouteConstants.addUserPath,
                      builder: (context, state) => const AddUsersPage(),
                    )
                  ])
            ]),
          ])
    ]);

class ScaffoldWithNextedNavigation extends StatelessWidget {
  const ScaffoldWithNextedNavigation({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey('ScaffoldWithNextedNavigation'));

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return ScaffoldWithNavigationBar(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch);
      } else {
        return ScaffoldWithNavigationRail(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: _goBranch);
      }
    });
  }
}

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: 'Vehicles', icon: Icon(Icons.bike_scooter)),
          NavigationDestination(label: 'Users', icon: Icon(Icons.person)),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                label: Text('Vehicles'),
                icon: Icon(Icons.bike_scooter),
              ),
              NavigationRailDestination(
                label: Text('Users'),
                icon: Icon(Icons.person),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Main content on the right (end)
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
