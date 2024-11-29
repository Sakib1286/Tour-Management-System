import 'dart:convert';

import 'package:flixtrip/AppPages/HomaPage.dart';
import 'package:flixtrip/CustomWidgets/CustomButton.dart';
import 'package:flixtrip/CustomWidgets/CustomTextF.dart';
import 'package:flixtrip/controller/cardController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

import '../Model/userInfoModel.dart';
import '../api_connection/api_connection.dart';

class InfoPage extends StatefulWidget {

  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();

}
class _InfoPageState extends State<InfoPage> {
var FormKey= GlobalKey<FormState>();
var usernameController=TextEditingController();
var phoneController=TextEditingController();
var emailController=TextEditingController();
var genderController= TextEditingController();
var personController= TextEditingController();
var priceController= TextEditingController();

final filledData = Get.put(cardController());
storedBookingInfo()async{
  var cost= int.parse(filledData.price.value)*filledData.person.value;

  var userdata={
    'user_name': usernameController.text.trim(),
  'user_number':phoneController.text.trim(),
    'user_email':emailController.text.trim(),
    'user_gender':genderController.text.trim(),
    'total_person':filledData.person.value.toString(),
    'total_cost':cost.toString()

  };
  // UserInfo userInfoModel=UserInfo(
  //
  //     usernameController.text.trim() ,
  //
  //     phoneController.text.trim(),
  //     emailController.text.trim(),
  //     genderController.text.trim(),
  //     filledData.person.value.toString(),
  //     price
  //
  //
  //
  //
  // );
  print("DUKSEEEE");
  try{
    var res= await http.post(
      //API.validateEmail
      Uri.parse(  API.info ),
        body:
       userdata
      // body: {
      //   'user_name':usernameController.text.trim() ,
      //   'user_number':phoneController.text.trim(),
      //   'user_email':emailController.text.trim(),
      //   'user_gender':genderController.text.trim(),
      //   'total_person':personController.text.trim(),
      //   'total_cost':priceController.text.trim(),
      //
      // },
    );




    if(res.statusCode==200){
      var stroedModel= res.body;
print("-----------------------------------------------------hi--");
print(stroedModel);
    //   if(stroedModel['Success']==true){
    //
    //     Fluttertoast.showToast(msg:"Congratulation !");
    //   }
    //   else{
    //     // register and save info in database
    //    // registerAndSaveUserRecord();
    //     //Get.to(LoginPage());
    //     Fluttertoast.showToast(msg: 'caution !\nFailed To Stored Data In Database');
    //   }
     }

  }catch(e){
    print(e.toString());
    // Fluttertoast.showToast(msg: e.toString());
    Get.snackbar('Error', "Error in catch");
  }


}


  final person= Get.put(cardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Enter Your Information",style: TextStyle(color: Colors.black),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextF(controller:usernameController,hintText: "Name", bgColor: Colors.black, underlineColor: Colors.black,bordersideColor: Colors.black, labelColor: Colors.black,lableText: "Inter Your Name", validator: (val) =>val ==""? "please write your name":null,),
              SizedBox(height: 15.h,),
              CustomTextF(controller:phoneController,hintText: "Number", bgColor: Colors.black, underlineColor: Colors.black,bordersideColor: Colors.black, labelColor: Colors.black, validator: (val) =>val ==""? "please write your Number":null),
              SizedBox(height: 15.h,),
              CustomTextF(controller:emailController,hintText: "Email", bgColor: Colors.black, underlineColor: Colors.black,bordersideColor: Colors.black, labelColor: Colors.black,validator: (val) =>val ==""? "please write your Email":null),
              SizedBox(height: 15.h,),
              CustomTextF(controller:genderController,hintText: "Gender", bgColor: Colors.black, underlineColor: Colors.black,bordersideColor: Colors.black, labelColor: Colors.black,validator: (val) =>val ==""? "please write your Gender":null),
              SizedBox(height: 15.h,),
              //CustomTextF(hintText: "Total Person", bgColor: Colors.black, underlineColor: Colors.black,bordersideColor: Colors.black, labelColor: Colors.black,validator: (val) =>val ==""? "Write Total number of person":null),

              CustomTextF(controller: personController,hintText: "Total person-       ${person.person.value.toString()} Total", bgColor: Colors.black, underlineColor: Colors.black,bordersideColor: Colors.black, labelColor: Colors.black, validator: (val) =>val ==""? "please write your Phone Number": null),

              SizedBox(height: 15.h,),
              CustomTextF(controller:priceController,hintText: "Total Cost -       ${int.parse(person.price.value)*person.person.value
              } BDT", bgColor: Colors.black, underlineColor: Colors.black,bordersideColor: Colors.black, labelColor: Colors.black, validator: (val) =>val ==""? "please write your Phone Number": null),
              SizedBox(height: 35.h,),

              CustomButton(onTap: (){
                //Get.to(HomePage());

            storedBookingInfo();



              }, text: "Payment", fontsize: 20, textcolor: Colors.black, bgcolor: Colors.orange, btnheight: 50.h, btnwidth: 350.w)

            ],
          ),
        ),
      ),
    );
  }
}
