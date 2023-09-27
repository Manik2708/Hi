import 'package:flutter/material.dart';
import 'package:hi/frontend/functions/hide_keyboard.dart';
import 'package:hi/frontend/widgets/create_account_form.dart';
import 'package:hi/frontend/widgets/date_picker.dart';
import 'package:provider/provider.dart';
import '../providers/show_password.dart';


class CreateAccount extends StatefulWidget {
  static const String routeName='/create-account-screen';
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}


class _CreateAccountState extends State<CreateAccount> {

  String dateOfBirth='';
  DatePicker datePicker=DatePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(!context.read<ShowPassword>().boolShowPassword){
      context.read<ShowPassword>().hidePassword();
    }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideKeyboard,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black, size: 30,),
          ),
          title: const Text('Create Account', style: TextStyle(color: Colors.black, fontSize: 25),),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.only(left: 18),
          child: SingleChildScrollView(
            child: CreateAccountForm()
          ),
        ),
      ),
    );
  }
}
