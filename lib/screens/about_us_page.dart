import 'package:newdesignpatternapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PageAppbar(title: "About Us",),
        body: content());
  }

  Widget content() {
    return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    const Text(
      'Hakkımızda',
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 20.0),
    const SizedBox(height: 20.0),
    const Text(
      'Bu uygulama, Mobil Programlama dersi için geliştirilmiştir.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.normal,
      ),
    ),
    const SizedBox(height: 20.0),
    Card(
      child: Column(
        children: const <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mehmet Ali Kuyucu'),
            subtitle: Text('Geliştirici'),
          ),

        ],
      ),
    ),
    const SizedBox(height: 20.0),
    ElevatedButton(
      style:ElevatedButton.styleFrom(backgroundColor: Colors.black),
      onPressed: () {
      },
      child: const Text(
        'Uygulamayı İndir',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  ],
);
  }}

