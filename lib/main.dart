import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/core/api/dio_consumer.dart';
import 'package:test_work/core/data/cache_helper.dart';
import 'package:test_work/core/repositry/user_repositry.dart';
import 'package:test_work/cubit/user_cubit.dart';
import 'package:test_work/screen/updata_user_data_view.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
await CacheHelper.cacheInti();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => UserCubit(userRepositry: UserRepositry(api: DioConsumer(dio: Dio())), dio: DioConsumer(dio: Dio()) ,)..getUserData(),
          child:  const UpdataUserData(),
        ));
  }
}
