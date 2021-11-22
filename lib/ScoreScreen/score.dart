import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Container(
        color: Colors.black12,
        child: Stack(
          fit: StackFit.expand,
          children: [

            Column(
              children: [
                const Spacer(flex: 4),
                Text(
                  "Score",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.grey),
                ),
                const Spacer(),
                Text(
                  "${_qnController.correctAns * 10}/${_qnController.questions.length * 10}",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.grey),
                ),
                const Spacer(flex: 4),
              ],
            )
          ],
        ),
      ),
    );
  }
}
