import 'package:flutter/material.dart';
import 'package:test_work/core/database/cache_helper.dart';
import 'package:test_work/core/function/go_router_navigation.dart/custom_navigation.dart';
import 'package:test_work/core/utils/app_font_style.dart';
import 'package:test_work/core/utils/app_string.dart';



class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
  
}

class _SplachScreenState extends State<SplachScreen> {
  bool onboardingVisted=CacheHelper.getvalue(key: 'visited')??false;


  
  @override
  void initState() {

    super.initState();
    onboardingVisted==true?
    splachScreenDalayed(path: '/test'):
    splachScreenDalayed(path: '/onBoarding');
    

  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        
          children: [
            Text(AppString.AppName,style: AppFontStyle.Pacifico40064,)
          ],
        ),
      ),
    );
  }
void splachScreenDalayed({required String path}) {
    Future.delayed(Duration(seconds: 2)).then((onValue){
      customPushNavigator(context: context, path: path);
    }
    );
  }
  
}
