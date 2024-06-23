import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:treximino_admin_app/src/features/authentication/login/view/login_page.dart';
import 'package:treximino_admin_app/src/features/user/view/add_users_page.dart';
import 'package:treximino_admin_app/src/features/user/view/user_page.dart';
import 'package:treximino_admin_app/src/features/vehicle/view/add_vehicle_page.dart';
import 'package:treximino_admin_app/src/features/vehicle/view/vehicle_page.dart';
import 'package:treximino_admin_app/src/shared/go_router/route_constants.dart';
import 'package:treximino_admin_app/src/shared/widgets/custom_app_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellUsersNavigatorKey = GlobalKey<NavigatorState>();
final _shellVehiclesNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = Provider<GoRouter>((ref){
  return GoRouter(
    initialLocation: RouteConstants.loginPath,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: RouteConstants.loginPath,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNextedNavigation(
                navigationShell: navigationShell);
          },
          branches: [
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
          ])
    ]);
});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: body,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
              label: 'Vehicles', icon: Icon(Icons.bike_scooter)),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              child: NavigationRail(
                selectedIndex: selectedIndex,
                onDestinationSelected: onDestinationSelected,
                extended: MediaQuery.of(context).size.width >= 650,
                destinations: const [
                  NavigationRailDestination(
                    label: Text(
                      'Staffs',
                      style: TextStyle(fontSize: 24),
                    ),
                    icon: Icon(Icons.work),
                  ),
                  NavigationRailDestination(
                    padding: EdgeInsets.zero,
                    label: Text(
                      'Vehicles',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    icon: Icon(Icons.bike_scooter, size: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
