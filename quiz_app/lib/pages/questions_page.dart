import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

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
        appBar: AppBar(title: const Text('Questions')),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: checkState
              ? Center(
                  child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          padding: const EdgeInsets.all(20)),
                      onPressed: () async {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Sonuç"),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Doğru Sayısı : $rightAns",
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                      "Yanlış Sayısı : ${questions.length - rightAns}",
                                      style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    style: OutlinedButton.styleFrom(
                                        backgroundColor:
                                            Colors.deepPurpleAccent,
                                        textStyle:
                                            const TextStyle(fontSize: 18)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage(),
                                          ));
                                    },
                                    child: const Text(
                                      "Anasayfaya Dön",
                                      style: TextStyle(color: Colors.white),
                                    ))
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        "Testi Bitir",
                        style: TextStyle(fontSize: 25),
                      )),
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
