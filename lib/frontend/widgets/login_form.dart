import 'package:flutter/material.dart';
import 'package:hi/connect/Services/login.dart';
import 'package:hi/frontend/functions/hide_keyboard.dart';
import 'package:hi/frontend/providers/show_password.dart';
import 'package:hi/frontend/widgets/common_text_field.dart';
import 'package:provider/provider.dart';

import 'common_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey=GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  Login login=Login();
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children:[ Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 201,),
                  const SizedBox(
                    height: 23,
                    width: 150,
                    child: Text('Email Address', style: TextStyle(fontSize: 15), ),
                  ),
                  CommonTextField(controller: _emailController, focusNode: focusNode, validator: (val){
                    RegExp emailValid=RegExp(r'\S+@\S+\.\S+');
                    if(val==null||val.isEmpty){
                      return 'This field cannot be empty';
                    }
                    else if(!emailValid.hasMatch(val)){
                      return 'Invalid Email Address';
                    }
                    return null;
                  },),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 23,
                    width: 150,
                    child: Text('Password', style: TextStyle(fontSize: 15)),
                  ),
                  Consumer<ShowPassword>(builder: (context, show, child)=>CommonTextField(controller: _passwordController, focusNode: focusNode, obscureText: show.boolShowPassword,),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Consumer<ShowPassword>(builder:(context, show, child)=>Checkbox(value: !show.boolShowPassword,
                          onChanged: (bool? val){
                            if(val==true){
                              context.read<ShowPassword>().showPassword();
                            }
                            else{
                              context.read<ShowPassword>().hidePassword();
                            }
                          })),
                      const Text('Show Password', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),

                    ],
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: CommonButton(
                        text: const Text('Login', style: TextStyle(fontSize: 20),),
                        onClick: (){
                          if(_formKey.currentState!.validate()){
                            login.login(context, _emailController.text, _passwordController.text);
                          }
                        },
                        height: 46,
                        width: 295,
                        color: const Color.fromARGB(255, 119, 31, 152),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                          child: const Text('Create Account', style: TextStyle(color: Colors.teal),),
                          onTap: (){
                            Navigator.pushNamed(context, '/create-account-screen');
                          }
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/change-password');
                        },
                        child: const Text('Forgot Password?', style: TextStyle(color: Colors.teal),),
                      ),
                    ],
                  )
                ],
              ),
            ),
    ]
    );

  }
}
