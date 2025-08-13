import 'package:first_app/start_button.dart';
import'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.secondScreen,{super.key});
  final void Function() secondScreen;
  @override
  Widget build(context){
    return Center(
      child:Column(
        mainAxisSize:MainAxisSize.min,
        children: [
            Image.asset('assets/images/image.png', width: 270,color:const Color.fromARGB(138, 251, 251, 251)),
            SizedBox(height: 40,),
            Text('Learning flutter the fun way!',
            style:TextStyle(color:Colors.white,fontSize: 25)
            ),
            SizedBox(height:25),
            StartButton(secondScreen),
      ],
      )
    );
  }
}