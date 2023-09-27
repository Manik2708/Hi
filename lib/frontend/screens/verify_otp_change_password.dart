import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/hide_keyboard.dart';
import 'package:hi/frontend/providers/change_password.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../connect/Services/change_password.dart';
import '../providers/set_state_providers.dart';
import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';
import 'package:hi/frontend/functions/onClick.dart';

class VerifyChangePassword extends StatefulWidget {
  const VerifyChangePassword({super.key});

  @override
  State<VerifyChangePassword> createState() => _VerifyChangePasswordState();
}

class _VerifyChangePasswordState extends State<VerifyChangePassword> {
  final TextEditingController _password=TextEditingController();
  final TextEditingController _otp=TextEditingController();
  final CountdownController _countdownController=CountdownController();
  ChangePasswordServices changePasswordServices=ChangePasswordServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SetState>().resetProvider();
    context.read<ChangePasswordProvider>().setOnVerificationScreen(true);
  }
  void onClickHere(){
    onClick(context, _countdownController, () {
      changePasswordServices.sendOtp(context, context.read<ChangePasswordProvider>().email);
    });
  }
  @override
  Widget build(BuildContext context) {
    context.read<SetState>().setOnPhoneClick(() {onClickHere();});
    context.read<SetState>().setVerifyPhoneBtnTxt('Resend OTP');
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
              const Text('Change Your ', style: TextStyle(fontSize:35, color: Colors.black, fontWeight: FontWeight.bold),),
              const Text('Password', style: TextStyle(fontSize:35, color: Colors.black, fontWeight: FontWeight.bold) ),
              const SizedBox(height: 100,),
              Center(
                child: Column(
                  children: [
                    Consumer<SetState>(builder:(context, setState, child)=> Text(setState.verifyPhone)),
                    const SizedBox(height: 5,),
                    const Text('on your respective Email Address'),
                    const SizedBox(height: 5,),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Center(child: CommonTextField(controller: _password, focusNode: focusNode,),),
              const SizedBox(height: 10,),
              Center(child: CommonTextField(controller: _otp, isPhone: true, textAlign: TextAlign.center, focusNode: focusNode,)),
              Padding(
                padding:  const EdgeInsets.only(left: 35),
                child:  Countdown(
                  controller: _countdownController,
                  seconds: 30,
                  build: (context, sec){
                    return Consumer<SetState>(builder:(context, setState, child)=> Text('Wait for ${sec.toInt().toString()}s', style: TextStyle(color: setState.timerTextColor),));
                  },
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer<SetState>(
                    builder:(context, setState, child)=> CommonButton(text:  Text(setState.verifyPhoneBtnTxt),color: setState.verifyPhoneBtnClr, onClick: setState.onPhoneVerifyClick,
                      width: 150, height: 40,),
                  ),
                  CommonButton(text: const Text('Verify'), onClick: (){
                    changePasswordServices.verifyOtp(context, _otp.text, _password.text);
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
