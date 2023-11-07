import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/models/question.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.questions, required this.rightAnswer, super.key});
  final List<Question> questions;
  final int rightAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Result page"),
          actions: [
            ElevatedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              child: const Text("Anasayfaya Dön"),
            )
          ],
        ),
        body: questions.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Doğru sayınız : $rightAnswer",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                            "Yanlış sayınız : ${questions.length - rightAnswer}",
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const Divider(
                            thickness: 1,
                          );
                        },
                        itemCount: questions.length,
                        itemBuilder: (context, index) {
                          var question = questions[index];
                          return ListTile(
                            iconColor: question.answer == question.userAnswer
                                ? Colors.green
                                : Colors.red,
                            title: Text(question.question),
                            subtitle: Text(
                                "Your answer is ${question.userAnswer}. Correct answer is ${question.answer}"),
                            leading: question.answer == question.userAnswer
                                ? const Icon(
                                    Icons.check_circle,
                                  )
                                : const Icon(Icons.cancel),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            : Center());
  }
}
