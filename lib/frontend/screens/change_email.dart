import 'package:flutter/material.dart';
import 'package:hi/connect/Services/change_email.dart';
import 'package:hi/frontend/functions/hide_keyboard.dart';

import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final TextEditingController _password=TextEditingController();
  final TextEditingController _email=TextEditingController();
  ChangeEmailServices changeEmailServices=ChangeEmailServices();
  final key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideKeyboard,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: null,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Change Email', style: TextStyle(fontSize:35, color: Colors.black, fontWeight: FontWeight.bold),),
              const SizedBox(height: 100,),
              const Text('Enter your Account\'s password'),
              const SizedBox(height: 10,),
              Form(
                key: key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Center(child: CommonTextField(controller: _password, focusNode: focusNode,)),
                    const SizedBox(height: 10,),
                    const Text('Enter your new Email Address'),
                    const SizedBox(height: 10,),
                    Center(child: CommonTextField(controller: _email, focusNode: focusNode,validator: (val){
                    RegExp emailValid=RegExp(r'\S+@\S+\.\S+');
                    if(val==null||val.isEmpty){
                      return 'This field cannot be empty';
                    }
                    else if(!emailValid.hasMatch(val)){
                      return 'Invalid Email Address';
                    }
                    return null;
                  },)),
                ],
              )),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonButton(text: const Text('Change Email'), onClick: (){
                  if(key.currentState!.validate()){
                    changeEmailServices.changeEmail(context, _password.text, _email.text);
                  }
                  }, width: 150,height: 40,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
