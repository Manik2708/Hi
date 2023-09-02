import 'package:flutter/material.dart';
import 'package:hi/frontend/screens/login.dart';
import 'package:hi/frontend/widgets/common_button.dart';
import 'package:hi/constants/global_variables.dart';
class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child:  Scaffold(
          body: SafeArea(
            child: Padding(
              padding:  const EdgeInsets.only(top: 60, bottom: 10, left: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const SizedBox(
                        width: 350,
                        height: 54,
                        child: Center(child: Text('Say Hi To', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),)),
                      ),
                       const SizedBox(
                        width: 350,
                        height: 54,
                        child: Center(child: Text('Your Crush', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        width: 350,
                        height: 23,
                        child: Center(child: Text('Helps you to connect with those', style: TextStyle(fontSize: 15,),)),
                      ),
                      const SizedBox(
                        width: 350,
                        height: 23,
                        child: Center(child: Text('whom you like, anonymously', style: TextStyle(fontSize: 15,),)),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 350,
                        width: 350,
                        child: Image.asset('${imageFolder}get_started_1.png'),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                       SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: CommonButton(
                            text: const Text('Get Started', style: TextStyle(fontSize: 20),),
                            onClick: (){
                            Navigator.pushNamed(context, LoginScreen.routeName);
                            },
                            height: 46,
                            width: 295,
                            color: const Color.fromARGB(255, 119, 31, 152),
                          ),
                        ),
                      )
                    ],
                ),
            ),
        ),
      ),
    );
  }
}
