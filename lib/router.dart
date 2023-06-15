import 'package:flutter/material.dart';
import 'package:todo_list/model/task.dart';
import 'package:todo_list/view/edit_page.dart';
import 'package:todo_list/view/main_view.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (BuildContext context) {
            return const MainView();
          },
        );

      case '/editPage':
        if (routeSettings.arguments != null) {
          return MaterialPageRoute(
            builder: (BuildContext context) {
              // ignore: cast_nullable_to_non_nullable
              return EditPage(routeSettings.arguments as Task);
            },
          );
        } else {
          // TODO: do something if no argument was passed
          return MaterialPageRoute(
              builder: (_) => const CircularProgressIndicator());
        }
      default:
        return MaterialPageRoute(
          builder: (_) => const CircularProgressIndicator(),
        );
    }
  }
}
