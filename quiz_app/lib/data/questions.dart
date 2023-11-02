import '../models/question.dart';

const List<Question> questions = [
  Question("Aşağıdakilerden hangisi state'i update eder?",
      ["setState()", "createState()", "build()", "initState()"], "setState()"),
  Question("Aşağıdakilerden hangisi programın çalışmasını sağlayan metotdur?",
      ["build()", "initState()", "main()", "setState()"], "main()"),
  Question(
      "Aşağıdaki widgetlardan hangisi içerdiği widgetları ortalamaya yarar?",
      ["Scaffold()", "Row()", "Column()", "Center()"],
      "Center()"),
  Question("Widgetleri alt alta yerleştirmeye yarayan widget hangisidir?",
      ["Column()", "Row()", "Center()", "Text()"], "Column()"),
];
