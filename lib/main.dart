import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //Leading underscore (_MyAppState) means the stateful Wiidget can only be used in this file.

  final _questions = const [
    {
      "questionText": "What is your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "WHite", "score": 1}
      ]
    }, // {} as shown above is a short way of creating Maps.
    {
      "questionText": "What is your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 11},
        {"text": "Elephant", "score": 5},
        {"text": "Lion", "score": 9}
      ]
    },
    {
      "questionText": "Who's is your favourite instructor?",
      "answers": [
        {"text": "Eddy", "score": 1},
        {"text": "Eddy", "score": 1},
        {"text": "Eddy", "score": 1},
        {"text": "Eddy", "score": 1}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  //statelesswidget is from material dart, which has widgets. THe override means thats we are changing the initial method build in the statelessWidget.
  // named arguments example home: in the materialAPp class use ({}) and do not have an exact position.
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //scaffold sets the background well
        appBar: AppBar(
          title: const Text("This is my first app!"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
