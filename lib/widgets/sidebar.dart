import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newdesignpatternapp/screens/beginner_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Sidebar extends StatefulWidget {

  Sidebar({Key? key, }) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _width=MediaQuery.of(context).size.width;
        final CollectionReference userRef =FirebaseFirestore.instance.collection('users');

    return SafeArea(
      child: Drawer(
        width:_width*0.6,
        backgroundColor: Colors.black,
          child: FutureBuilder(
            future: userRef.doc(_auth.currentUser!.uid).get(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Text('loading...');
              }
              final  userData=snapshot.data;
              debugPrint(userData.toString());
              return  ListView(
                  children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(Icons.person, size: 50,color: Colors.black,),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                     Text(
                      "${userData!['name']}",
                      style: const TextStyle(fontSize: 24,color: Colors.white),
                    )
          
                  ],
                ),
              ),
            ),
            const Divider(thickness: 2,color: Colors.yellowAccent,height: 0),
            ListTile(
              leading: const Icon(Icons.emoji_food_beverage_rounded,color: Colors.yellowAccent,),
              title:  Text('Support Us',style: customTextStyle(),),
              onTap: () {
                Navigator.pushNamed(context, "/support");
              },
            ),
            const Divider(thickness: 2,color: Colors.yellowAccent,height: 0),
            
            ListTile(
              leading: const Icon(Icons.book,color: Colors.yellowAccent,),
              title:  Text('About Us',style: customTextStyle(),),
              onTap: () {
                Navigator.pushNamed(context, "/about");
              },
            ),
            const Divider(thickness: 2,color: Colors.yellowAccent,height: 0),
            ListTile(
              leading:const Icon(Icons.exit_to_app,color: Colors.yellowAccent,),
              title:  Text('Çıkış yap',style:customTextStyle(),),
              onTap: () async {
                try {
                  await _auth.signOut();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BeginnerPage()));
                } catch (e) {
                  ScaffoldMessenger(child: Text('Çıkış yapılamadı'));
                  print('Çıkış yapılamadı');
                }
              },
              
            ),
            const Divider(thickness: 2,color: Colors.yellowAccent,height: 0),
                  ],
          
                );
            },
            
          )), 
    );
  }

  TextStyle customTextStyle() => const TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.white);
}
