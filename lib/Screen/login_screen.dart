import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_blog/Screen/component/post.dart';
import 'package:my_blog/Screen/register_screen.dart';
import '../utls/utls.dart';
import '../widgets/round_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";
  bool showSpiner = false;
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

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
                Text('Log In',
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
                          return value!.isEmpty ? "Enter your Email" : null;
                        },
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller: passwordController,
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
                          return value!.isEmpty ? "Enter your Password" : null;
                        },
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      RoundButton(title: 'Log In', onPress: ()async{
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            showSpiner = false;
                          });
                          try{
                            final user = await _auth.signInWithEmailAndPassword(
                              email: email.toString().trim(),
                              password: email.toString().trim(),
                            );
                            if(user != null){
                              toastMessage('user sucessfully create');
                              setState(() {
                                showSpiner = true;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
                            }
                          }catch(e){
                            print(e);
                            toastMessage(e.toString());
                          }
                        }
                      }),
                    ],
                  ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Account is not?'),
                     TextButton(onPressed: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                     }, child: Text("Sign Up"),),
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
