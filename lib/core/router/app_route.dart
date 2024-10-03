import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_work/feature/splach/presentation/view/splach_screen.dart';
import 'package:test_work/test_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplachScreen();
      },
    ),
  GoRoute(path: '/test',builder: (BuildContext context, GoRouterState state) {
    return TestView();
    
  },)
  ],
);