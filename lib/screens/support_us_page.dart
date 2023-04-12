import 'package:newdesignpatternapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
class SupportUs extends StatelessWidget {
  const SupportUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppbar(title: "Support US",),
      body:
      Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    const Text(
      'Uygulamayı Destekle',
      style: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 20.0),
    const Icon(
      Icons.favorite_border,
      size: 50.0,
      color: Colors.red,
    ),
    const SizedBox(height: 20.0),
     const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Bizimle birlikte kaliteli bir hizmet için destek vermek ister misin?',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    const SizedBox(height: 20.0),
    Row(mainAxisAlignment: MainAxisAlignment.center,children: [

      ElevatedButton(
      style:ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () {
        // Bağış yapma sayfasına yönlendirme işlemleri
      },
      child: const Text(
        'Bağış Yap',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    const SizedBox(width: 10),
    ElevatedButton(
      style:ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () {
        // Uygulama paylaşım işlemleri
      },
      child: const Text(
        'Uygulamayı Paylaş',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),    
    ],)
  ],
)
    );
  }
}