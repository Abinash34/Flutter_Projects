import 'package:first_app/Answer_Button.dart';
import 'package:first_app/data/questions.dart';
import 'package:first_app/models/quiz_questions.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  
  const QuestionsScreen({required this.chooseAnswer,super.key});
  
  final Function(String answer) chooseAnswer; // triggred on choosing an answer

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.chooseAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });

  }

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];
    return  
     Center(child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           Text(
            currentQuestion.text,
            style: TextStyle(color: Colors.white,fontSize: 25,),
            textAlign: TextAlign.center,
           ),
            
            SizedBox(height: 30), 
        
            ...currentQuestion.getShuffledAnswers().map((answer){
               return  Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: AnswerButton(text: answer,
                 fun: (){
                  answerQuestion(answer);
                }
                )
                );
            }
            ),
          ],
        ),
     
         );
  }
}

