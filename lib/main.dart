import 'package:flutter/material.dart';
import 'package:test_work/feature/splach/presentation/view/splach_screen.dart';

import 'core/router/app_route.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      
    );
  }
}