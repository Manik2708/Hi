import 'package:flutter/material.dart';

class DatePicker{
  Future<DateTime?> pickDate({required BuildContext context}){
    return showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now());
  }
}
