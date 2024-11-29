import 'dart:convert';
import 'package:flixtrip/AppPages/HomaPage.dart';
import 'package:flixtrip/Auth_L_S/ForgetPass.dart';
import 'package:flixtrip/Auth_L_S/Shared_prefarence/user_prefarence.dart';
import 'package:flixtrip/Auth_L_S/Signup.dart';
import 'package:flixtrip/CustomWidgets/CustomButton.dart';
import 'package:flixtrip/CustomWidgets/CustomTextF.dart';
import 'package:flixtrip/api_connection/api_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/user.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var FormKey= GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController= TextEditingController();

  loginUserNow()async {

    try{
      final sha= await SharedPreferences.getInstance();
      sha.setString('EMAIL', emailController.text.trim());
      var res = await http.post(

        Uri.parse(API.login),
        body: {
          "user_email": emailController.text.trim(),


          "user_password": passwordController.text.trim()

        },
      );
      print(emailController.text);
      print(passwordController.text);

      if (res.statusCode == 200) {
        var resBodyofLogin = jsonDecode(res.body);
        print("I am --------------------------------------------------------SUCCESSFULLY");

        print(res.body);
        if (resBodyofLogin['Success'] == true) {

          print("JSON DECODEEE COME ---------------------------------------------------------SUCCESSFULLY");
          Fluttertoast.showToast(
              msg: "Congratulations ! \nYou are Successfully Login ");
          User userInfo= User.fromJson (resBodyofLogin["userData"]);
          //save userinfo in local storage
          await rememberUserPrep.stroedUserInfo(userInfo);
          // Future.delayed(Duration(milliseconds:2000),()
          //{
          Get.to(HomePage());

          // }
          //);
        }
        else {
          // register and save info in database
          Fluttertoast.showToast(
              msg: "Incorrect Email or password !\n Please Try Again");
        }
      }else{
        print("BIGGGGGGGGGGGGGGGGG ERORRRRRRRRRRRRR");
      }
    }catch(e){
      print("ERooooooor: " +e.toString());
    }
  }

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
                    height: 400.h,
                    width: 325.w,

                    child: Padding(
                      padding: const EdgeInsets.all(15.0),

                      child: Form(
                        key:FormKey,
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 25.sp,),)),
                            SizedBox(height: 15,),
                            CustomTextF(controller: emailController,hintText: "Email", underlineColor: Colors.white,bgColor: Colors.white, bordersideColor: Colors.white,labelColor: Colors.black, validator: (val) =>val ==""? "please write your email":null,),
                            SizedBox(height: 20,),
                            CustomTextF(controller: passwordController,validator:(val)=>val ==""? "please write your password":null,hintText: "Password",underlineColor: Colors.white,bgColor: Colors.white,bordersideColor: Colors.white,labelColor: Colors.black),
                            SizedBox(height: 5,),

                            TextButton(onPressed: (){
                              Get.to(ForgetpassPage());
                            }, child: Text("Forget Password ?",style: TextStyle(color: Colors.white),)),
                            SizedBox(height: 40,),
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


                ),
                SizedBox(height: 30,),
                CustomButton(onTap: (){
                  // Get.to(HomePage());

                  if(FormKey.currentState!.validate()){
                    loginUserNow();
                  }
                }, text:"Login", fontsize: 20.sp, textcolor: Colors.white, bgcolor:Colors.grey, btnheight: 50, btnwidth: 300)
              ],

            ),
          ),

        ),

      ),
    );
  }
}
