import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_blog/Screen/component/post.dart';
import 'package:my_blog/Screen/login_screen.dart';
import 'package:my_blog/utls/utls.dart';
import 'package:my_blog/widgets/round_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = "";
  String password = "";
  final _formkey = GlobalKey<FormState>();
  bool showSpiner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpiner,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: const [
                Text('Register',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Form(
                    key: _formkey,
                      child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.deepOrange,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        onChanged: (String value){
                          email = value;
                        },
                        validator: (value){
                          return value!.isEmpty ? "Enter Your Email" : null;
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.deepOrange,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.password),
                        ),
                        onChanged: (String value){
                        password = value;
                      },
                        validator: (value){
                          return value!.isEmpty ? "Enter Your Password" : null;
                        },
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      RoundButton(title: 'Register', onPress: ()async{
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            showSpiner = true;
                          });
                          try{
                            final user = _auth.createUserWithEmailAndPassword(
                                email: email.toString().trim(),
                                password: email.toString().trim(),
                            );
                            if(user != null){
                              toastMessage('user sucessfully create');
                              setState(() {
                                showSpiner = false;
                              });
                            }
                          }catch(e){
                            print(e);
                            toastMessage(e.toString());
                          }
                        }
                      }),
                    ],
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Account is'),
                      TextButton(onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginPage()));
                      }, child: Text('Login')),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
