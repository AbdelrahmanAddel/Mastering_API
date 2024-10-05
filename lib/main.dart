import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_work/core/database/cache_helper.dart';

import 'core/router/app_route.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();
  

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      
    );
  }
}