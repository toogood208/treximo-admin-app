import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.appTitle})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;
  final String appTitle;

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
      title: Text(
        widget.appTitle,
        style: Theme.of(context).textTheme.bodyLarge,
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
