import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_work/feature/onboarding/cubit/boarding_cubit.dart';
import 'package:test_work/feature/splach/presentation/view/splach_screen.dart';
import 'package:test_work/test_view.dart';

import '../../feature/onboarding/presentation/view/onboarding.dart';


final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplachScreen();
      },
    ),
    GoRoute(
      path: '/test',
      builder: (BuildContext context, GoRouterState state) {
        return TestView();
      },
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => BoardingCubit(),
          child: Onboarding(),
        );
      },
    )
  ],
);
