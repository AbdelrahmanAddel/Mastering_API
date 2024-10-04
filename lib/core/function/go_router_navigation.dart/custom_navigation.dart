import 'package:go_router/go_router.dart';

void customPushNavigator({ required context,required String path}){
  GoRouter.of(context).push(path);
}
void customPushAndReplacementNavigator({ required context,required String path}){
  GoRouter.of(context).pushReplacement(path);
}