import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:quiz_app/quiz_screen/quiz.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../constant.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black12,
          child: Stack(
            fit: StackFit.expand,
            children: [

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        "LET'S PLAY QUIZ",
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Enter your Informations below',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const TextField(
                          decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        hintText: 'Enter name',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      )),
                      Spacer(),
                      InkWell(
                        onTap: () => Get.to(QuizScreen()),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 60,
                          decoration: const BoxDecoration(
                              gradient: KprimaryGradient,
                              borderRadius: BorderRadius.all(Radius.circular(12))),
                          child: Text(
                            'Lets Start Quiz',
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

    );
  }
}
