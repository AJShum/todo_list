import 'package:flutter/material.dart';
import 'package:todo_list/view/constant.dart';
import 'package:todo_list/view/custom_color_scheme.dart';
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
        textTheme: textTheme,
        colorScheme: darkColorScheme,
        extensions: const <ThemeExtension<dynamic>>[CustomColorScheme.dark],
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return CustomColorScheme.dark.green;
            } else {
              return CustomColorScheme.dark.suport_separator;
            }
          }),
          checkColor: MaterialStateProperty.resolveWith((states) {
            return CustomColorScheme.dark.back_secondary;
          }),
        ),
      ),
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
        extensions: const <ThemeExtension<dynamic>>[CustomColorScheme.dark],
      ),
      home: const MainView(),
    );
  }
}
