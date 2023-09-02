import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final bool? readOnly;
  final bool? isPhone;
  final TextAlign? textAlign;
  final String?Function(String?)? validator;
  const CommonTextField({super.key, required this.controller, this.obscureText, this.readOnly, this.isPhone, this.validator, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle
      ),
      width: 350,
      height: 75,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 10,
          )
          ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 1.5
            )
          )
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
      ),
    );
  }
}
