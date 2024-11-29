import 'package:flixtrip/AppPages/Detailes.dart';
import 'package:flixtrip/AppPages/HomaPage.dart';
import 'package:flixtrip/AppPages/Info.dart';
import 'package:flixtrip/Auth_L_S/ForgetPass.dart';
import 'package:flixtrip/Auth_L_S/Login.dart';
import 'package:flixtrip/Splash.dart';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(390, 840),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return GetMaterialApp(
            theme: ThemeData(colorScheme: ColorScheme.highContrastLight()),
            debugShowCheckedModeBanner: false,
            home:FutureBuilder( builder:(context,dataSnapshot){
              return HomePage();
              
            }, future: null,),
          );
        });
  }
}
