import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz_app/component/progress_bar.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/model/questions.dart';
import 'package:quiz_app/question_card/questioncard.dart';

import '../constant.dart';

class Body extends StatelessWidget {
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
      Image.asset(
        "asset/back_quiz.png",
        fit: BoxFit.fill,
      ),
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: ProgressBar(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Obx(()=> Text.rich(
                TextSpan(
                    text: 'Question1 ${_questionController.questionNumber.value} ',
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "/${_questionController.questions.length}",
                          style:
                              TextStyle(color: Colors.black54, fontSize: 18)),
                    ]),
              ),
            ),),
              Divider(thickness: 1.8),
            const SizedBox(
              height: 4,
            ),
            Expanded(
                child: PageView.builder(
              onPageChanged: _questionController.updateTheQnNum,
              physics: const NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              itemCount: _questionController.questions.length,
              itemBuilder: (context, index) => QuestionCard(
                question: _questionController.questions[index],
              ),
            )),
          ],
        ),
      )
    ]);
  }
}

class Options extends StatelessWidget {
  const Options(
      {Key? key, required this.text, required this.index, required this.press})
      : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return Colors.green;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return Colors.red;
              }
            }
            return Colors.grey;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == Colors.red ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(color: getTheRightColor(), fontSize: 16),
                  ),
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: getTheRightColor() == Colors.grey
                            ? Colors.transparent
                            : getTheRightColor(),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: getTheRightColor())),
                    child: getTheRightColor() == Colors.grey
                        ? null
                        : Icon(getTheRightIcon(), size: 16),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
