import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void flutterToast({required String toastString,required Color color}){
  Fluttertoast.showToast(
        msg: toastString,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0
    );
}