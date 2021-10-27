import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    // print(resultScore);

    if (resultScore <= 8) {
      resultText = "You are awesome and great";
    } else if (resultScore <= 12) {
      resultText = "Pretty Likeable";
    } else if (resultScore <= 16) {
      resultText = "You are so ... strange";
    } else {
      resultText = "You are so bad";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            child: const Text(
              "Restart Quiz",
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
