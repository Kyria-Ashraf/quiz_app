import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          color: const Color.fromARGB(125, 255, 255, 255),
          'assets/images/quiz-logo.png',
          width: 350,
          height: 350,
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Learn Flutter the fun way!",
          style: GoogleFonts.adamina(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.deepPurple),
            padding: const EdgeInsets.all(20),
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz"),
        ),
      ],
    );
  }
}
