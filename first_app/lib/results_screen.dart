import 'package:first_app/data/questions.dart';
import 'package:first_app/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:first_app/quiz.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({
    super.key,
    required this.choosenAnswer,
    required this.restartQuiz,
  });
  final void Function() restartQuiz;
  final List<String> choosenAnswer;

  State<ResultScreen> createState() {
    return _ResultScreenState();
  }
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < widget.choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'answers': questions[i].answers[0],
        'chosen_answer': widget.choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numCorrectQuestions =
        summaryData.where((data) {
          return data['answers'] == data['chosen_answer'];
        }).length;
    final numTotalQuestions = questions.length;

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                  ' You answred  $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: QuestionSummary(summaryData),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: widget.restartQuiz,
                icon: Icon(Icons.refresh),
                label: Text('Restart Quiz'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(212, 202, 82, 224),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
