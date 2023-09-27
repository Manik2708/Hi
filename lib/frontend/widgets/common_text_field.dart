import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool? obscureText;
  final bool? readOnly;
  final bool? isPhone;
  final TextAlign? textAlign;
  final String?Function(String?)? validator;
  final int? maxLines;
  final double? height;
  final String? hintText;
  final bool? autoFocus;
  const CommonTextField({super.key, required this.controller,required this.focusNode, this.obscureText, this.readOnly, this.isPhone, this.validator, this.textAlign, this.maxLines, this.height, this.hintText, this.autoFocus});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle
      ),
      width: 350,
      height: height??75,
      child: TextFormField(
        autofocus: autoFocus??false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 10,
          ),
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.5
            )
          ),
          hintText: hintText
        ),
      controller: controller,
     obscureText: obscureText==null?false:obscureText!,
     readOnly: readOnly==null?false:readOnly!,
        keyboardType: isPhone==null?TextInputType.text:TextInputType.phone,
        validator: validator ?? (val){
          if(val==null||val.isEmpty){
            return 'This field cannot remain empty';
          }
          return null;
        },
        textAlign: textAlign==null?TextAlign.start:textAlign!,
        maxLines: maxLines ?? 1,
      ),
    );
  }
}
