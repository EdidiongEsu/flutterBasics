import 'package:flutter/material.dart ';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final dynamic questions;
  final int questionIndex;
  final dynamic answerQuestion;

  const Quiz(
      {Key? key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //Question mark refers to if else statement. This are called ternary operators.
      children: [
        Question(
          questions[questionIndex]["questionText"],
        ),

        ...(questions[questionIndex]["answers"] as List<Map<String, dynamic>>)
            .map((answer) {
          /// (... is a spread operator.)
          //Sread operator gets a list and pulls all the values and add it to the surronding list as indivilvidual values.

          return Answer(() => answerQuestion(answer["score"]), answer["text"]);
        }).toList() //this is the answer
      ],
    );
  }
}
