import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:newdesignpatternapp/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BeginnerPage extends StatefulWidget {
  @override
  _BeginnerPageState createState() => _BeginnerPageState();
}

class _BeginnerPageState extends State<BeginnerPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _registerEmailController=TextEditingController();
  final TextEditingController _registerPasswordController=TextEditingController();


  bool _onLogin = true;
  
@override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    super.dispose();
  }
  void changeOnLogin() {
    setState(() {
      _onLogin = !_onLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.yellowAccent,
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: Center(
            child: SizedBox(
              width: width * 0.85,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          changeOnLogin();
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            border: _onLogin
                                ? const Border(
                                    bottom: BorderSide(
                                      width: 2.0,
                                      color: Colors.black,
                                    ),
                                  )
                                : null,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50.0),
                      GestureDetector(
                        onTap: () {
                          changeOnLogin();
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            border: !_onLogin
                                ? const Border(
                                    bottom: BorderSide(
                                      width: 2.0,
                                      color: Colors.black,
                                    ),
                                  )
                                : null,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _onLogin
                      ? Column(
                          children: [
                            TextField(
                                controller: _emailController,
                                style: const TextStyle(color: Colors.black),
                                decoration: customInputDecoration('Email')),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                                controller: _passwordController,
                                obscureText: true,
                                style: const TextStyle(color: Colors.black),
                                decoration: customInputDecoration('Password')),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                _login();
                              },
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      border: Border.all(
                                          color: Colors.yellowAccent),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: const Center(
                                        child: Text('Login >',
                                            style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 10,
                                                fontWeight: FontWeight.bold)),
                                      ))),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            TextField(
                                controller: _nameController,
                                style: const TextStyle(color: Colors.black),
                                decoration: customInputDecoration('Name')),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                                controller: _registerEmailController,
                                style: const TextStyle(color: Colors.black),
                                decoration: customInputDecoration('Email')),
                            const SizedBox(
                              height: 10,
                            ),
                            TextField(
                              
                                controller: _registerPasswordController,
                                obscureText: true,
                                style: const TextStyle(color: Colors.black),
                                decoration: customInputDecoration('Password')),
                            const SizedBox(
                              height: 10,
                            ),

                             const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                _registerUser();
                              },
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      border: Border.all(
                                          color: Colors.yellowAccent),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: const Center(
                                        child: Text('Signup >',
                                            style: TextStyle(
                                                color: Colors.white,
                                                letterSpacing: 10,
                                                fontWeight: FontWeight.bold)),
                                      ))),
                            ),
                          ],
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration customInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.black),
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
          width: 1.0,
        ),
      ),
    );
  }

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
        debugPrint('User ID: ${userCredential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('user not found')));
        debugPrint('User not found');
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('wrong password')));
      }
    }
  }

  Future<void> _registerUser() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _registerEmailController.text,
      password: _registerPasswordController.text,
    );
    String? uid = userCredential.user?.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'name': _nameController.text,
      'email': _registerEmailController.text,
      'password':_registerPasswordController.text,
      'createdAt': DateTime.now(),
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Succesfull please login')));
    changeOnLogin();
  } catch (e) {
    debugPrint('Error creating user: $e');
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Error creating user: $e')));
  }
}

}
