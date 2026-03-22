import 'package:flutter/material.dart';
import 'package:lesson_5_1/app/di/inject_model.dart';
import 'package:lesson_5_1/presentation/screen/quiz_page.dart';

void main() {
  configureDependencies();
  runApp(SafeArea(child: MaterialApp(home: QuizPage(),)));
}