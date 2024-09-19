import 'package:basic/app/algorithm_task/screens/algorithm_task_home_screen/algorithm_task_home_screen.dart';
import 'package:basic/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return AlgorithmTaskHomeScreen();
      }),
]);
