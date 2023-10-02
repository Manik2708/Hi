import 'package:flutter/material.dart';
import 'package:hi/connect/models/crush_model.dart';
import 'package:hi/frontend/functions/send_confession.dart';
import 'package:hi/frontend/widgets/common_button.dart';
import 'package:hi/frontend/widgets/common_text_field.dart';

class CrushScreen extends StatelessWidget {
  final CrushModel crush;
  const CrushScreen({super.key, required this.crush});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _confessionController=TextEditingController();
    final FocusNode _focusNode=FocusNode();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(crush.username, style: const TextStyle(color: Colors.black),),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only( left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                   SizedBox(height: 70,width: 350, child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.account_circle_rounded, size: 70,),
                      const SizedBox(width: 5,),
                       Text(crush.name, style: const TextStyle(fontSize: 20),)
                    ],
                  ),
                  ),
              const SizedBox(height: 10,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Row(
                      children: [
                        SizedBox(
                          width: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Text('Crush', style: TextStyle(fontSize: 18),),
                               SizedBox(height: 5,),
                               Text('0', style: TextStyle(fontSize: 18),)
                            ],
                          ),
                        ),
                        VerticalDivider(thickness: 2.5, color: Colors.black,),
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text('Confessions', style: TextStyle(fontSize: 18),),
                               SizedBox(height: 5,),
                              Text('0', style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                        VerticalDivider(thickness: 2.5,),
                        SizedBox(
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Chats', style: TextStyle(fontSize: 18),),
                              SizedBox(height: 5,),
                              Text('0', style: TextStyle(fontSize: 18),)
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 30,),
              Center(child: CommonTextField(controller: _confessionController, maxLines: 200, height: 300, hintText: 'Write your Confession here',focusNode: _focusNode,)),
              const SizedBox(height: 10,),
              Center(child: CommonButton(text: const Text('Confess'), onClick: (){
                sendConfession(crush, context, _confessionController.text);
              }, width: 350, height: 50,),)
            ],
          ),
        ),
      ),
    );
  }
}
