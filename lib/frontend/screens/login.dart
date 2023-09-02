import 'package:flutter/material.dart';
import 'package:hi/constants/global_variables.dart';
import 'package:hi/frontend/widgets/login_form.dart';



class LoginScreen extends StatefulWidget {
  static const String routeName='/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap:(){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black, size: 30,),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                 const Positioned.fill(child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      width: 300,
                      height: 36,
                      child: Text("Hello, Welcome Back", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),),
                    ),
                    SizedBox(
                      width: 280,
                      height: 17,
                      child: Text("Happy to see you again, please", style: TextStyle(fontSize: 15, color: Colors.black87),),
                    ),
                     SizedBox(height: 5,),
                    SizedBox(
                      width: 280,
                      height: 46,
                      child: Text("Login", style: TextStyle(fontSize: 15, ),),
                    ),
                  ],
                )),
                Container(
                  alignment: Alignment.topRight,
                  height: 229,
                  width: double.infinity,
                    child: Container(
                      alignment: Alignment.topRight,
                      height: 229,
                      width: 188.22,
                      child: Image.asset('${imageFolder}sitting.png'),
                    ),
                ),
                   const SizedBox(
                    child: LoginForm()
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
