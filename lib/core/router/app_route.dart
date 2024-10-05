import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_work/feature/auth/cubit/auth_cubit.dart';
import 'package:test_work/feature/auth/presentation/view/sign_in_view.dart';
import 'package:test_work/feature/auth/presentation/view/sign_up_view.dart';
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
    ),
        GoRoute(
      path: '/SignUp',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: SignUpView(),
        );
      },
    ),
            GoRoute(
      path: '/SignIn',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: SignInView(),
        );
      },
    )
  ],
);
