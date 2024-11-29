//import 'dart:convert';

//import 'package:flixtrip/Auth_L_S/Shared_prefarence/currentUser.dart';
import 'package:flixtrip/CustomWidgets/PackageCon.dart';
import 'package:flixtrip/CustomWidgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_connection/api_connection.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    String name= "";
  Future<void> fetchUserByEmail() async {
    print("___________________________________________HI___________________");
    //final String apiUrl = 'http://your-server-address/find_user.php?email=$email';
    final sha= await SharedPreferences.getInstance();
    final shareEmail=sha.getString("EMAIL");
    try {
      final response = await http.get(Uri.parse(API.data1+"?user_email=${shareEmail}"));

      if (response.statusCode == 200) {

        final data = (response.body);
        //Decode the JSON string into a Map
        //Map<String, dynamic> jsonMap = jsonDecode(data);
        print(data);
        //print(jsonMap);
        final statusRegex = RegExp(r'"status":"(.*?)"');
        final userIdRegex = RegExp(r'"user_id":"(.*?)"');
        final userNameRegex = RegExp(r'"user_name":"(.*?)"');
        final userEmailRegex = RegExp(r'"user_email":"(.*?)"');
        final userPhoneRegex = RegExp(r'"user_phone":"(.*?)"');
        final userPasswordRegex = RegExp(r'"user_password":"(.*?)"');

        // Extracting matches
        String? status = statusRegex.firstMatch(data)?.group(1);
        String? userId = userIdRegex.firstMatch(data)?.group(1);
        String? userName = userNameRegex.firstMatch(data)?.group(1);
        String? userEmail = userEmailRegex.firstMatch(data)?.group(1);
        String? userPhone = userPhoneRegex.firstMatch(data)?.group(1);
        String? userPassword = userPasswordRegex.firstMatch(data)?.group(1);

        // Print the extracted values


        setState(() {
          print("Status: $status");
          print("User ID: $userId");
          print("User Name: $userName");
          print("User Email: $userEmail");
          print("User Phone: $userPhone");
          print("User Password: $userPassword");
          name=userName!;
          sha.setString("namePass", userName);
        });
      } else {
        print('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
@override
  void initState() {
    // TODO: implement initState
  fetchUserByEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        //leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.tour), label: "Booked"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hello,${name}",
                   // "Hello,${data[index]["user_name"]}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_sharp),
                      Text(
                        "Dhaka , Bangladesh",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text("Available Packages", style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),),
              SizedBox(height: 10.h,),
              PackageCard(IText: "assets/images/zyl1.jpg",
                hText: "Sylhet Day Long Tour (2 Night / 1 Days)",
                pText: "1500 ",
                inText: "Dhaka - Sylhet -Dhaka Fare\nBreakfast\nLunch\nLocal Transport\nEntry Fee\nGuide Cost",),
              SizedBox(height: 10.h,),
              PackageCard(IText: "assets/images/cox1.jpg",
                  hText: "Explore Cox's Bazar (3 Night / 2 Days)",
                  pText: "2500",
                  inText: "Dhaka - Cox's Bazar -Dhaka Fare\nBreakfast\nLunch\nDinner\n3 Star Hotel\nLocal Transport\nEntry Fee\nGuide Cost"),
              SizedBox(height: 10.h,),
              PackageCard(IText: "assets/images/sajek.jpg",
                  hText: "Explore Sajek Valley  (3 Night / 2 Days)",
                  pText: "4500",
                  inText: "Dhaka - Sajek -Dhaka Fare\nBreakfast\nLunch\nDinner\n3 Star Hotel\nLocal Transport\nEntry Fee\nGuide Cost"),
              SizedBox(height: 10.h,),
              PackageCard(IText: "assets/images/st.jpg",
                  hText: "Saint Martin Relax Tour  (3 Night / 2 Days)",
                  pText: "4500",
                  inText: "Dhaka - Teknaf -Dhaka Fare\nBreakfast\nShip\nLunch\ndinner\n3 Star Hotel\nLocal Transport\nEntry Fee\nGuide Cost"),
              SizedBox(height: 10.h,),
              PackageCard(IText: "assets/images/zyl2.jpg",
                  hText: "Sylhet Relax Tour  (3 Night / 2 Days)",
                  pText: "2500",
                  inText: "Dhaka - Sylhet -Dhaka Fare\nBreakfast\nLunch\nDinner\nLocal Transport\n3 Star Hotel\nEntry Fee\nGuide Cost"),
              SizedBox(height: 10.h,),
              PackageCard(IText: "assets/images/th.jpg",
                  hText: "Explore Tanguar Haor  (3 Night / 2 Days)",
                  pText: "4500",
                  inText: "Dhaka - Sunamganj -Dhaka Fare\nBreakfast\nLunch\nNight Stay at Boat\nLocal Transport\nEntry Fee\nGuide Cost"),
            ],
          ),
        ),
      ),

    );
  }

}
