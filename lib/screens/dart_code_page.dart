import 'package:dart_code_viewer2/dart_code_viewer2.dart';
import 'package:newdesignpatternapp/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:newdesignpatternapp/code_data/codes.dart';

class DartCodePage extends StatelessWidget {
  final int indx;
  const DartCodePage({Key? key, required this.indx}) : super(key: key);
final String code ='const DartCodePage({Key? key, required this.indx}) : super(key: key);';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
        body: SafeArea(
          child: Center(
            child: DartCodeViewer.dark(Code.Codes[indx],)
              ),
        ),
          );
  }
}
