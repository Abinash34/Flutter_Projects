import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  
  const AnswerButton(
      {
      required this.text, 
      required this.fun,
      super.key
      }
    );
  
  final void Function() fun;
  final String text;

  Widget build(context){  
    return 
      
       ElevatedButton(
          onPressed: fun, 
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
            backgroundColor: const Color.fromARGB(255, 105, 0, 123),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(40))
          ),
          child: Text(text,textAlign: TextAlign.center,),
      );
    
  } 
}

