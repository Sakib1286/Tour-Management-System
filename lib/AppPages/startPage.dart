import 'package:flixtrip/AppPages/HomaPage.dart';
import 'package:flixtrip/Auth_L_S/Login.dart';
import 'package:flixtrip/CustomWidgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {

  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Expanded(
    child: Container(
    alignment: Alignment.center,
      height: MediaQuery.of(context).size.height *1,
      width: MediaQuery.of(context).size.width *1,
      // margin: EdgeInsets.all(6.0),

      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/image7.jpg"),
            fit: BoxFit.cover
        ),

      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Center(
              child: Text("Discover The World\n  Away From Home",style: TextStyle(color: Colors.white,fontSize: 35.sp,fontWeight: FontWeight.bold),),


            ),
            SizedBox(height: 5.h,),
            Text("Enjoy a Smooth,Stress Free Travel Journey\n with Ease and Simplicity Every Step.",style: TextStyle(color: Colors.white.withOpacity(.9),fontSize: 15.sp,fontWeight: FontWeight.bold),),
            SizedBox(height: 5.h,),
            Row(
              children: [
                CustomButton(onTap: (){
                  Get.to(HomePage());
                }, text: "Skip", fontsize: 20.sp, textcolor:Colors.white, bgcolor:Colors.grey, btnheight: 40, btnwidth: 150,
                ),
                SizedBox(width: 15.w,),
                CustomButton(onTap: (){}, text: "Next", fontsize: 20.sp, textcolor:Colors.black, bgcolor:Colors.white, btnheight: 40, btnwidth: 150)
              ],
            )
          ],
        ),
      ),
    ),
      ));
  }
}
