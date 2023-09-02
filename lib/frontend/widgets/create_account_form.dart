import 'package:flutter/material.dart';
import 'package:hi/connect/Services/create%7C_account.dart';
import 'package:hi/frontend/widgets/common_text_field.dart';
import 'package:hi/frontend/widgets/date_picker.dart';
import 'package:hi/frontend/widgets/dialogue_box.dart';
import 'package:provider/provider.dart';
import '../providers/date_of_birth.dart';
import '../providers/show_password.dart';
import 'common_button.dart';
class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _userNameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _dobController=TextEditingController();
  final _key=GlobalKey<FormState>();
  DateTime? dob;
  CreateAccountServices createAccountServices=CreateAccountServices();
  String dateOfBirth='';
  DatePicker datePicker=DatePicker();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Icon(Icons.account_circle_rounded, size: 150, color: Color.fromARGB(255, 119, 31, 152)),
          ),
          const SizedBox(
            height: 23,
            width: 150,
            child: Text('Name', style: TextStyle(fontSize: 15)),
          ),
          CommonTextField(controller: _nameController),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 23,
            width: 150,
            child: Text('Username', style: TextStyle(fontSize: 15)),
          ),
          CommonTextField(controller: _userNameController),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 23,
            width: 150,
            child: Text('Email', style: TextStyle(fontSize: 15)),
          ),
          CommonTextField(controller: _emailController, validator: (val){
            RegExp emailValid=RegExp(r'\S+@\S+\.\S+');
            if(val==null||val.isEmpty){
              return 'This field cannot be empty';
            }
            else if(!emailValid.hasMatch(val)){
              return 'Invalid Email Address';
            }
            return null;
          },),
          const SizedBox(
            height: 20,
          ),
          Consumer<DateOfBirth>(
            builder: (context,date, child )=>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: ()async{
                     dob=await datePicker.pickDate(context: context);
                    dateOfBirth=dob==null?'':'${dob?.day}-${dob?.month}-${dob?.year}';
                    date.setDob(dateOfBirth);
                    _dobController.text=date.dob;
                  },
                  child: const SizedBox(
                    height: 23,
                    width: 150,
                    child: Text('Date of Birth', style: TextStyle(fontSize: 15)),
                  ),
                ),
                CommonTextField(controller: _dobController, readOnly: true,),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 23,
            width: 150,
            child: Text('Password', style: TextStyle(fontSize: 15)),
          ),
          Consumer<ShowPassword>(builder: (context, show, child)=>CommonTextField(controller: _passwordController, obscureText: show.boolShowPassword, validator: (val){
            RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
            if(val==null||val.isEmpty){
              return 'This field cannot be empty';
            }
            else if(!pass_valid.hasMatch(val)){
              return 'Password should contain at least one Capital Letter, Small Letters, Numbers & a special character ';
            }
            return null;
          },),),
          const SizedBox(height: 10,),
          Row(
            children: [
              Consumer<ShowPassword>(builder:(context, show, child)=>Checkbox(value: !show.boolShowPassword,
                  onChanged: (bool? val){
                    if(val==true){
                      context.read<ShowPassword>().showPassword();
                    }
                    else{
                      context.read<ShowPassword>().hidePassword();
                    }
                  })),
              const Text('Show Password', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
            ],
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: CommonButton(
                text: const Text('Create Account', style: TextStyle(fontSize: 20),),
                onClick: (){
                  if(_key.currentState!.validate()) {
                    if (DateTime.now().year - dob!.year < 16) {
                          showDialogBox(context: context, title: 'Not Eligible', content: 'You are not 16 years old', buttonText: null, onClick: null);
                    }
                    else {
                      createAccountServices.createAccount(context: context, name: _nameController.text, email: _emailController.text, anonymousId: '', username: _userNameController.text, password: _passwordController.text, dob: dob!.toString(), isEmailVerified: false, token: '', id: '');
                    }
                  }
                },
                height: 46,
                width: 295,
                color: const Color.fromARGB(255, 119, 31, 152),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
