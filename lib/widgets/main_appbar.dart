import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: const Text("Design Patterns"),
      centerTitle: true,
      actions: [IconButton(icon: const Icon(Icons.notifications),onPressed: (){
        debugPrint('notificatina basıldı');
      },),]
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
