import 'package:flutter/material.dart';
import 'package:newdesignpatternapp/screens/about_us_page.dart';
import 'package:newdesignpatternapp/screens/support_us_page.dart';
import 'package:newdesignpatternapp/screens/beginner_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) =>  BeginnerPage(),
        "/about": (context) => const AboutUs(),
        "/support": (context) => const SupportUs()
      },
      title: 'Material App',
    );
  }
}

