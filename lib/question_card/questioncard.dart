import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:quiz_app/component/body.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/model/questions.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

 QuestionCard({required this.question});

  @override
  Widget build(BuildContext context) {
    QuestionController _questioncontroller = Get.put(QuestionController());

    return  Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
            ),
          
              child:Column(children: [
                Text(
                question.question,
                  style:  const TextStyle(

                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                ...List.generate(
                  question.options!.length,
                      (index) => Options(
                    index: index,
                    text: question.options![index],
                    press: () => _questioncontroller.checkAns(question, index),
                  ),
                ),
              ]),
            ),
      );

  }
}
