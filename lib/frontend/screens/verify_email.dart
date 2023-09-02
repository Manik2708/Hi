import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hi/connect/Services/send_otp.dart';
import 'package:hi/connect/Services/verify_otp.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import '../../connect/models/user.dart';
import '../providers/set_state_providers.dart';
import '../providers/user.dart';
import '../widgets/common_button.dart';
import '../widgets/common_text_field.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final VerifyOtp verifyOtp=VerifyOtp();
  final CountdownController _countdownController=CountdownController();
  Future<bool> moveToBackScreen()async{
    return false;
  }
  void onClick(){
    context.read<SetState>().setVerifyPhone('We have sent you an OTP (One Time Password)');
    SendOtp sendOtp=SendOtp();
    sendOtp.sendOtp(context);
    context.read<SetState>().setVerifyPhoneBtnClr(Colors.grey);
    context.read<SetState>().setOnPhoneClick((){});
    context.read<SetState>().setTimerColor(Colors.black);
    _countdownController.restart();
    Timer(const Duration(seconds: 30), () {
      context.read<SetState>().setVerifyPhoneBtnClr(const Color.fromARGB(255, 119, 31, 152));
      context.read<SetState>().setVerifyPhone('Click on Resend to request another OTP');
      context.read<SetState>().setVerifyPhoneBtnTxt('Resend OTP');
      context.read<SetState>().setOnPhoneClick((){onClick();});
      context.read<SetState>().setTimerColor(Colors.white);
    });
  }
  final TextEditingController _emailOTP=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    User user=context.read<UserProvider>().user;
    context.read<SetState>().setOnPhoneClick(() {onClick();});
    return WillPopScope(
      onWillPop: moveToBackScreen,
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
              const Text('Verify your ', style: TextStyle(fontSize:35, color: Colors.black, fontWeight: FontWeight.bold),),
              const Text('Email Address', style: TextStyle(fontSize:35, color: Colors.black, fontWeight: FontWeight.bold) ),
              const SizedBox(height: 100,),
              Center(
                child: Column(
                  children: [
                    Consumer<SetState>(builder:(context, setState, child)=> Text(setState.verifyPhone)),
                    const SizedBox(height: 5,),
                    Text('on the Email: ${user.email}'),
                    const SizedBox(height: 5,),
                    GestureDetector(
                      child: const Text('Change Email Address?', style: TextStyle(color: Colors.teal),),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Center(child: CommonTextField(controller: _emailOTP, isPhone: true, textAlign: TextAlign.center,)),
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
                    verifyOtp.verifyOtp(context, _emailOTP.text);
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
