import 'dart:convert';

import 'package:flixtrip/CustomWidgets/CustomButton.dart';
import 'package:flixtrip/CustomWidgets/CustomTextF.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../Model/user.dart';
import '../api_connection/api_connection.dart';
import 'Login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var FormKey= GlobalKey<FormState>();
  var usernameController=TextEditingController();
  var phoneController=TextEditingController();
var emailController=TextEditingController();
var passwordController= TextEditingController();

  validateUseremail() async{
try{
 var res= await http.post(
    //API.validateEmail
    Uri.parse(  API.validateEmail ),
    body: {
    'user_email':emailController.text.trim()
  },
  );
 if(res.statusCode==200){
var resBodyofValidateEmail= jsonDecode(res.body);

if(resBodyofValidateEmail['emailFound']==true){
Fluttertoast.showToast(msg: "Email Already Exists");
}
else{
  // register and save info in database
  registerAndSaveUserRecord();
  Get.to(LoginPage());
}
 }

}catch(e){
  print(e.toString());
 // Fluttertoast.showToast(msg: e.toString());
  Get.snackbar('Error', "Error in email ad");
}

  }

  // Signup mathod
  registerAndSaveUserRecord()async{
User userModel=User(
  1,
  usernameController.text.trim() ,
  emailController.text.trim(),
  phoneController.text.trim(),
  passwordController.text.trim()


);
try{
  var res= await http.post(
      Uri.parse(API.signup),
      body: userModel.toJson()

  );
  if(res.statusCode==200){
    var resBodyOfSignup=jsonDecode(res.body);
    if(resBodyOfSignup['Success']==true){
      Fluttertoast.showToast(msg: "Congratulation ! Signup Successfull");
    }else{
      Fluttertoast.showToast(msg: "Error ! Try again later");
      //print("Errorrr");
     Get.snackbar('Error', "Erroe in signup");

      //Get.showSnackbar();
    }
  }
}catch(e){
 print(e.toString());
 //Fluttertoast.showToast(msg: e.toString());
 Get.snackbar('Error', "Error in signup--");

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

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text("FlixTrip",style: TextStyle(color: Colors.black.withOpacity(.8),fontSize: 30,fontStyle: FontStyle.italic),),
                SizedBox(height: 45.h,),
                Center(


                  child: Container(
                    // color: Colors.black.withOpacity(.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.black.withOpacity(.5)
                    ),
                    height: 470.h,
                    width: 325.w,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),

                      child: Form(
                        key: FormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Center(child: Text("Signup",style: TextStyle(color: Colors.white,fontSize: 25.sp,),)),
                            SizedBox(height: 10.h,),
                            CustomTextF(controller: usernameController,hintText: "Username",underlineColor: Colors.white,bgColor: Colors.white,bordersideColor: Colors.white,labelColor: Colors.black,validator: (val) =>val ==""? "please write your username":null),
                            SizedBox(height: 10.h,),

                            CustomTextF(controller: emailController,hintText: "Email",underlineColor: Colors.white,bgColor: Colors.white,bordersideColor: Colors.white,labelColor: Colors.black,validator: (val) =>val ==""? "please write your email":null),
                            SizedBox(height: 10.h,),

                            CustomTextF(controller: phoneController,hintText: "Phone Number ",underlineColor: Colors.white,bgColor: Colors.white,bordersideColor: Colors.white,labelColor: Colors.black,validator: (val) =>val ==""? "please write your Phone Number":null),
                            SizedBox(height: 10.h,),

                            CustomTextF(controller: passwordController,hintText: "Password",suffixIcon: IconButton(onPressed: (){}, icon:Icon(Icons.remove_red_eye_sharp,color: Colors.white,)),underlineColor: Colors.white,bgColor: Colors.white,bordersideColor: Colors.white, labelColor: Colors.black,validator: (val) =>val ==""? "please write your password":null),
                            SizedBox(height: 10.h,),
                            TextButton(onPressed: (){}, child: Text("Remember Me",style: TextStyle(color: Colors.white),)),
                            Center(child: Text("Didn't have Any Account ",style: TextStyle(color:Colors.white,fontSize: 15.sp),
                            ),

                            ),
                            Center(child: TextButton(
                                onPressed: (){
                             Get.to(LoginPage());

                                  //Get.to(LoginPage());
                                }, child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 15.sp),))),

                          ],
                        ),
                      ),
                    ),

                  ),


                ),
                 SizedBox(height: 30,),
                CustomButton(onTap: (){

                  if(FormKey.currentState!.validate()){
                 validateUseremail();


                  }
                 // Get.to(LoginPage());
                }, text:"Signup", fontsize: 20, textcolor: Colors.white, bgcolor:Colors.grey, btnheight: 50, btnwidth: 300)
              ],

            ),
          ),

        ),

      ),
    );
  }
}
