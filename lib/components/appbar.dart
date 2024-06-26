import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool hasAction;
  final List<Widget>? actions;
  const MyAppBar({
    super.key,
    required this.title,
    required this.hasAction,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(),
      actions: hasAction ? actions : [],
      title: Text(title, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.blue,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
