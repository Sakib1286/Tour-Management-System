import 'package:flixtrip/AppPages/Detailes.dart';
import 'package:flixtrip/Auth_L_S/Login.dart';
//import 'package:flixtrip/CustomWidgets/CustomDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PackageCard extends StatelessWidget {
  final String hText;
  final String pText;
  final String IText;
  final String inText;

  const PackageCard({super.key, required this.hText, required this.pText, required this.IText, required this.inText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //Get.to(detailsPage());
        Get.to(CustomdetailsPage(bText: pText, iText:inText,  nText: hText, pText:IText,));
      },
      child: SingleChildScrollView(
        child: Card(
          elevation: 15,
          shadowColor: Colors.black,
          color: Colors.white.withOpacity(.7),
          child: SizedBox(
            height: 250.h,
            width: 350.w,
            child:
            Expanded(
              child: Column(
        
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage(IText),fit: BoxFit.fill,height: 150,width: 450,),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hText,style: TextStyle(color: Colors.black,fontSize: 17.sp,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic)),
                        //SizedBox(height: 2.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("BDT- ${pText}Only/ per Person",style: TextStyle(color: Colors.black,fontSize: 17.sp,fontStyle: FontStyle.italic)),
                            IconButton(onPressed: (){}, icon:Icon(Icons.share)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
        
        
            ),
          ),
        
        ),
      ),
    );
  }
}
