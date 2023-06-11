import 'package:flutter/material.dart';
import 'package:todo_list/view/constant.dart';
import 'package:todo_list/view/main_view.dart';

void main() {
  runApp(const ToDoApp());
}

// ignore: public_member_api_docs
class ToDoApp extends StatelessWidget {
  // ignore: public_member_api_docs
  const ToDoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        useMaterial3: false,
        colorScheme: darkColorScheme,
      ),
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: lightColorScheme,
      ),
      home: const MainView(),
    );
  }
}
