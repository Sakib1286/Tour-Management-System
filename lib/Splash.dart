import 'dart:async';

import 'package:flixtrip/Auth_L_S/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
    
    super.initState();
    _controller=AnimationController(vsync: this, duration:Durations.extralong4);
    Timer(Duration(seconds: 3),(){
      Get.to(LoginPage());
    });
  }

  @override
  void dispose() {
   _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }
  Widget _buildUI(){
return Stack(

  children: [
    Center(
    child: Lottie.asset("assets/animi/animi3.json",
    repeat: false,
      width: 300,
      height: 300,
        fit: BoxFit.cover
    ),
       ),
]);
  }
}
