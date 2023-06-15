import 'package:flutter/material.dart';
import 'package:todo_list/main_binding.dart';
import 'package:todo_list/router.dart';
import 'package:todo_list/view/constant.dart';
import 'package:todo_list/view/custom_color_scheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final mainBinding = MainBinding();
  await mainBinding.dependencies();
  runApp(ToDoApp());
}

// ignore: public_member_api_docs
class ToDoApp extends StatelessWidget {
  // ignore: public_member_api_docs
  ToDoApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO list',
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
        // FIX: DRY?
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return CustomColorScheme.light.green;
            } else {
              return CustomColorScheme.light.suport_separator;
            }
          }),
          checkColor: MaterialStateProperty.resolveWith((states) {
            return CustomColorScheme.light.back_secondary;
          }),
        ),
      ),
      onGenerateRoute: _appRouter.onGeneratedRoute,
    );
  }
}
