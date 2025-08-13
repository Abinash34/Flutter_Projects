import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {

  QuestionContainer({super.key, required this.child});
  final Widget child;

  Widget build(context){
    return 
    Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius:BorderRadius.circular(30),
                color: const Color.fromARGB(30, 255, 255, 255),
              ),
              child: child,
    );

  }
}