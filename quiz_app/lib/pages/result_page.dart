import 'package:flutter/material.dart';

import '../main.dart';

class ResultPage extends StatelessWidget {
  final int? rightAns;
  final int? qlen;
  const ResultPage(this.rightAns, this.qlen, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Doğru Sayısı : $rightAns",
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              "Yanlış Sayısı : ${qlen! - rightAns!}",
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: Colors.deepPurpleAccent),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                },
                child: const Text(
                  "Testi Yeniden Çöz",
                  style: TextStyle(fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
