import 'package:flutter/material.dart';
import 'package:my_blog/Screen/login_screen.dart';
import 'package:my_blog/Screen/register_screen.dart';
import 'package:my_blog/widgets/round_button.dart';


class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset('images/download.png',
              height: 150,),
            ],
          ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 30.0),
           child: Column(
             children: [
               RoundButton(
                 title: 'Login',
                 onPress: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                 },
               ),
               SizedBox(
                 height: 30.0,
               ),
               RoundButton(
                 title: 'Register',
                 onPress: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                 },
               ),
             ],
           ),
         ),
        ],
      ),
    );
  }
}
