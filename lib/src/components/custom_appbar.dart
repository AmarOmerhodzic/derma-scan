import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final VoidCallback? onPressed;

   CustomAppBar({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: ColorConstants.primary,
        title: Text(
          title ?? '',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Navigator.canPop(context)
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: onPressed ?? () => Navigator.pop(context, false),
            )
          : null,);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
