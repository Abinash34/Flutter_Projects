import 'package:flutter/material.dart';

class QuestionDetails extends StatelessWidget {

  QuestionDetails(this.data,{super.key});
  Map<String,Object> data;

  Widget build(context){
    return Expanded(   /// what does this do 
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,  // This cross Axis alignment 
                        children: [
                          Text( data['question'] as String,style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 3,),
                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('Correct Ans:',style: TextStyle(color: const Color.fromARGB(255, 19, 190, 24),fontSize: 17),),
                          SizedBox(width: 5,),
                            Expanded(child: Text(data['answers'] as String,style: TextStyle(color: const Color.fromARGB(204, 255, 255, 255),fontSize: 17),))]
                          ),
                          SizedBox(height: 3,),
                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('You chose: ',style:TextStyle(color: const Color.fromARGB(255, 214, 161, 3),fontSize: 17),),
                          SizedBox(width: 5,),
                            Expanded(child: Text(data['chosen_answer'] as String,style: TextStyle(fontSize: 17),),),
                            ],
                          ),
                          SizedBox(height: 8,),
                        ],
                      ),
                    );
  }
}