import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  // Widget? screen;
/*
  @override
  void initState() {
    screen = StartScreen(switchScreen);
    super.initState();
  }
  */

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      // screen = QuestionsScreen(onSelectAnswer: chooseAnswer);
      //conected the list "selectedAnswers" to the screen "QuestionsScreen" to store chosen answers in it
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    //list of chosen answers to check and correct after the quiz is over

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //after the questions are done
        activeScreen = 'results-screen';
        //selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Color.fromARGB(255, 116, 59, 190),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: screenWidget,
            /*
            another solution that doesnt require the initState() method:
            child: activeScreen == "start-screen"  // -> condition
            ? StartScreen(switchScreen)       // -> condition is true
            : QuestionsScreen()               // -> condition is false 
             */
          ),
        ),
      ),
    );
  }
}
