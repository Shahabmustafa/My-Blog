import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_blog/Screen/component/post.dart';
import 'package:my_blog/Screen/option_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = auth.currentUser;
    if(user != null){
      Timer(Duration(seconds: 3),() =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PostScreen())));
    }else{
      Timer(Duration(seconds: 3),() =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OptionScreen())));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Image.asset("images/download.png")
        ],
      ),
    );
  }
}
