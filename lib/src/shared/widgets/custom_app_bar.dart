import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.only(left: 24),
        child: CircleAvatar(
          child: Icon(
            Icons.person,
          ),
        ),
      ),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text("Jane S."),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 24),
          child: Badge(child: Icon(Icons.notifications)),
        )
      ],
    );
  }
}
