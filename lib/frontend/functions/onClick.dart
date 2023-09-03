import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import '../providers/set_state_providers.dart';
void onClick(BuildContext context, CountdownController _countdownController, VoidCallback action){
  context.read<SetState>().setVerifyPhone('We have sent you an OTP (One Time Password)');
  action();
  context.read<SetState>().setVerifyPhoneBtnClr(Colors.grey);
  context.read<SetState>().setOnPhoneClick((){});
  context.read<SetState>().setTimerColor(Colors.black);
  _countdownController.restart();
  Timer(const Duration(seconds: 30), () {
    context.read<SetState>().setVerifyPhoneBtnClr(const Color.fromARGB(255, 119, 31, 152));
    context.read<SetState>().setVerifyPhone('Click on Resend to request another OTP');
    context.read<SetState>().setVerifyPhoneBtnTxt('Resend OTP');
    context.read<SetState>().setOnPhoneClick((){onClick(context, _countdownController, action);});
    context.read<SetState>().setTimerColor(Colors.white);
  });
}