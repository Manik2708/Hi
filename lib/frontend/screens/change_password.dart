import 'package:flutter/material.dart';
import 'package:hi/connect/Services/change_password.dart';
import 'package:hi/frontend/functions/hide_keyboard.dart';
import 'package:hi/frontend/providers/change_password.dart';
import 'package:provider/provider.dart';


import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _email=TextEditingController();
  ChangePasswordServices changePasswordServices=ChangePasswordServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ChangePasswordProvider>().setOnVerificationScreen(false);
  }
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
              const Text('Change Password', style: TextStyle(fontSize:35, color: Colors.black, fontWeight: FontWeight.bold),),
              const SizedBox(height: 100,),
             const Text('Enter your Email Address/Username'),
              const SizedBox(height: 10,),
              Center(child: CommonTextField(controller: _email, focusNode: focusNode,)),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonButton(text: const Text('Send OTP'), onClick: (){
                    changePasswordServices.sendOtp(context, _email.text);
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
