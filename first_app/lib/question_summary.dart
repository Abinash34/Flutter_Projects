  import 'package:first_app/Question_Container.dart';
import 'package:first_app/data/questions.dart';
  import 'package:first_app/question_details.dart';
  import 'package:flutter/material.dart';

  class QuestionSummary extends StatelessWidget{

    QuestionSummary(this.summaryData,{super.key});

    final List<Map<String, Object>> summaryData;

    @override
    Widget build(BuildContext context) {
      return  
      Column(children: 
          summaryData.map((data){
            final isCorrect = data['answers'] == data['chosen_answer'];
            return
               QuestionContainer(
                 child: Row( 
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Baseline(
                          baseline: 20,
                          baselineType: TextBaseline.alphabetic,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,

                            width: 20, height: 20,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isCorrect ? Colors.green:Colors.red,  
                            ),

                            child: Text(((data['question_index'] as int ) + 1).toString(), 
                            
                                              style: TextStyle(color: Colors.black,
                                              ),
                            ),
                            ),
                        ),
                          SizedBox(width: 5,),
                 
                        QuestionDetails(data),
                      ],
                    ),
               );
              
          
          }).toList(),
          );
      
    }
  }