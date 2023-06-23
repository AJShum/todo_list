import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/logic/main_bloc.dart';
import 'package:todo_list/router.dart';
import 'package:todo_list/view/constant.dart';
import 'package:todo_list/view/custom_color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance..registerSingleton<MainCubit>(MainCubit());
  runApp(ToDoApp());
}

// ignore: public_member_api_docs
class ToDoApp extends StatelessWidget {
  var themeState = 1;

  // ignore: public_member_api_docs
  ToDoApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO list',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      darkTheme: ThemeData(
        useMaterial3: true,
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
      themeMode: themeState == 0
          ? ThemeMode.system
          : (themeState == 1 ? ThemeMode.light : ThemeMode.dark),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: textTheme,
        extensions: const <ThemeExtension<dynamic>>[CustomColorScheme.light],
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
