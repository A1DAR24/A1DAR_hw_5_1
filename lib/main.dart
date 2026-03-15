import 'package:flutter/material.dart';
import 'package:lesson_5_1/di/inject_model.dart';
import 'package:lesson_5_1/home_page.dart';

void main() {
  configureDependencies();
  runApp(SafeArea(child: MaterialApp(home: HomePage(),)));
}