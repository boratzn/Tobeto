import 'package:flutter/material.dart';

import '../data/questions.dart';
import '../models/question.dart';
import 'result_page.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int currQuestionIdx = 0;
  int rightAns = 0;
  bool checkState = false;

  @override
  Widget build(BuildContext context) {
    Question question = questions[currQuestionIdx];
    return Scaffold(
        appBar: AppBar(title: const Text('Questions')),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: checkState
              ? Center(
                  child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(20)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ResultPage(rightAns, questions.length),
                            ));
                      },
                      child: const Text(
                        "Testi Bitir",
                        style: TextStyle(fontSize: 25),
                      )),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      question.question,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    ...question.options.map((e) {
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (e == question.answer) rightAns++;

                            if (currQuestionIdx < questions.length - 1) {
                              currQuestionIdx++;
                            } else {
                              checkState = true;
                            }
                          });
                        },
                        child: Text(e),
                      );
                    }),
                  ],
                ),
        ));
  }
}
