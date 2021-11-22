import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quiz_app/ScoreScreen/Score.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:quiz_app/question_card/questioncard.dart';
import 'package:quiz_app/quiz_screen/quiz.dart';
import 'package:quiz_app/welcom_screen/welcomscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:const WelcomeScreen(),
      title: 'Quiz App',

      theme: ThemeData.dark(),

    );
  }
}


