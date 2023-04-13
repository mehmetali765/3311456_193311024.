import 'package:newdesignpatternapp/models/design_patterns_model.dart';
import 'package:newdesignpatternapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:newdesignpatternapp/screens/dart_code_page.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key, required this.designPattern, required this.indx})
      : super(key: key);
  final DesignPatterns designPattern;
  final int indx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppbar(
        title: designPattern.title,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                designPattern.content,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SizedBox(height: 20,),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DartCodePage(indx: indx,)));
                },
                child: Text("Show ${designPattern.title} Code",style: TextStyle(color: Colors.black,fontSize: 18,decoration:TextDecoration.underline  ),))
          ],
        ),
      ),
    );
  }
}
