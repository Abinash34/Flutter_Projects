import 'package:first_app/data/questions.dart';
import 'package:first_app/questions_screen.dart';
import 'package:first_app/results_screen.dart';
import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'questions_screen.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  var screenStatus = 'StartScreen';

  void secondScreen() {
    setState(() {
      screenStatus = 'QuestionsScreen()';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      screenStatus = 'StartScreen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];

        screenStatus = 'result_screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget activeState = StartScreen(secondScreen);

    if (screenStatus == 'QuestionsScreen()') {
      activeState = QuestionsScreen(chooseAnswer: chooseAnswer);
    }

    if (screenStatus == 'result_screen') {
      activeState = ResultScreen(
        choosenAnswer: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purpleAccent,
                const Color.fromARGB(255, 158, 79, 172),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child:
              activeState, // child:activeState == 'homepage'?StartScreen(secondScreen):QuestionsScreen(),
        ),
      ),
    );
  }
}
