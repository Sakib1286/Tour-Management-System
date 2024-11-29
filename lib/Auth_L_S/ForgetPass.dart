import 'package:flixtrip/AppPages/HomaPage.dart';
import 'package:flixtrip/Auth_L_S/Login.dart';
import 'package:flixtrip/Auth_L_S/Signup.dart';
import 'package:flixtrip/CustomWidgets/CustomButton.dart';
import 'package:flixtrip/CustomWidgets/CustomTextF.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class ForgetpassPage extends StatelessWidget {
  ForgetpassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height *1,
          width: MediaQuery.of(context).size.width *1,
          // margin: EdgeInsets.all(6.0),

          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/image2.jpg"),
                fit: BoxFit.cover
            ),

          ),
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("FlixTrip",style: TextStyle(color: Colors.black.withOpacity(.8),fontSize: 30,fontStyle: FontStyle.italic),),
                SizedBox(height: 45.h,),

                Center(


                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.black.withOpacity(.5)
                    ),
                    height: 270.h,
                    width: 325.w,

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),

                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 25.sp,),)),
                          SizedBox(height: 15,),
                          CustomTextF(hintText: "Email", underlineColor: Colors.white,bgColor: Colors.white, bordersideColor: Colors.white,labelColor: Colors.black,validator: (val) =>val ==""? "please write your email":null),
                          SizedBox(height: 20,),
                          //CustomTextF(hintText: "Password",underlineColor: Colors.white,bgColor: Colors.white,bordersideColor: Colors.white,labelColor: Colors.black),
                         // SizedBox(height: 5,),

                          //TextButton(onPressed: (){}, child: Text("Forget Password ?",style: TextStyle(color: Colors.white),)),
                         // SizedBox(height: 40,),
                          Center(child: Text("Didn't have Any Account ",style: TextStyle(color:Colors.white,fontSize: 15.sp),
                          ),

                          ),
                          Center(child: TextButton(
                              onPressed: (){
                                Get.to(SignupPage());
                              }, child: Text("Signup",style: TextStyle(color: Colors.white,fontSize: 15.sp),))),

                        ],
                      ),
                    ),

                  ),


                ),
                SizedBox(height: 30,),
                CustomButton(onTap: (){
                  Get.to(LoginPage());
                }, text:"Go To Login", fontsize: 20.sp, textcolor: Colors.white, bgcolor:Colors.grey, btnheight: 50, btnwidth: 300)
              ],

            ),
          ),

        ),

      ),
    );
  }
}
