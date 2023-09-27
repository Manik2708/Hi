import 'package:flutter/material.dart';

final FocusNode focusNode=FocusNode();

void hideKeyboard(){
  focusNode.unfocus();
}