import 'package:flutter/material.dart';
import 'package:quiz_app/pages/result_page.dart';

import '../data/questions.dart';
import '../models/question.dart';

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
        appBar: AppBar(
          title: const Text('Questions'),
          actions: checkState
              ? [
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultPage(
                                  questions: questions, rightAnswer: rightAns),
                            ));
                      },
                      child: const Text(
                        "Testi Bitir",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))
                ]
              : null,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: checkState
              ? const Center(
                  child: Text(
                    "Testiniz Bitmiştir. Yukarıdan Testi Bitir Diyerek Sonucunuzu görebilirsiniz.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            question.userAnswer = e;
                            if (e == question.answer) rightAns++;

                            if (currQuestionIdx < questions.length - 1) {
                              currQuestionIdx++;
                            } else {
                              checkState = true;
                            }
                          });
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                        ),
                        child: Text(e),
                      );
                    }),
                  ],
                ),
        ));
  }
}
