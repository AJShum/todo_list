import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/logic/main_bloc.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/view/edit_page.dart';
import 'package:todo_list/view/main_view.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return BlocProvider<MainCubit>.value(
              value: GetIt.instance.get<MainCubit>(),
              child: const MainView(),
            );
          },
        );

      case '/editPage':
        if (routeSettings.arguments != null) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              return BlocProvider<MainCubit>.value(
                value: GetIt.instance.get<MainCubit>(),
                child: EditPage(routeSettings.arguments as Task),
              );
            },
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => const CircularProgressIndicator(),
          );
        }
      default:
        return MaterialPageRoute(
          builder: (_) => const CircularProgressIndicator(),
        );
    }
  }
}
