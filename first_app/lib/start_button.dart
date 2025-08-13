import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
 const StartButton(this.secondScreen,{super.key});
 final void Function() secondScreen;
 @override
Widget build(context){
return OutlinedButton.icon(onPressed: secondScreen, 
style:OutlinedButton.styleFrom(foregroundColor: Colors.white),
icon:Icon(Icons.arrow_right_alt),
label: Text('Start Quiz'));
}

}