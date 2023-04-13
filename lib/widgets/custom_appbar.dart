import 'package:flutter/material.dart';

class PageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PageAppbar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:Colors.black ,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
