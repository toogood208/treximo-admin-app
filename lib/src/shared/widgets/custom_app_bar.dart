import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treximino_admin_app/src/features/authentication/notifier/login_notifier.dart';
import 'package:treximino_admin_app/src/shared/extensions/capitalize_extension.dart';
import 'package:treximino_admin_app/src/shared/widgets/custom_spinner.dart';

class CustomAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  ConsumerState<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends ConsumerState<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authNotifierProvider);
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.only(left: 24),
        child: CircleAvatar(
          child: Icon(
            Icons.person,
          ),
        ),  
      ),
      title: user.when(
          data: (data) {
            
            return Text(
              "${data['data']['firstName'].toString().capitalize()} ${data['data']['lastName'][0].toUpperCase()}.",
              style: Theme.of(context).textTheme.bodyLarge,
            );
          },
          error: (err, stk) {
            print(stk);
            return Text(err.toString());
          },
          loading: () => customSpinner()),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 24),
          child: Badge(child: Icon(Icons.notifications)),
        )
      ],
    );
  }
}
