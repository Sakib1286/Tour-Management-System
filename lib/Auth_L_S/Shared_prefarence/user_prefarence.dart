import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/user.dart';

class rememberUserPrep
{


  static Future<void> stroedUserInfo(User userInfo) async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    String userJsonData= jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser",userJsonData);


  }
  static Future<User?> readUserInfo() async
  {
    User ?currentUserInfo;
    SharedPreferences preferences= await SharedPreferences.getInstance();
    String ? userInfo= preferences.getString("currentUser");
    if(userInfo!=null){
      Map<String,dynamic>userDataMap=jsonDecode(userInfo);
      currentUserInfo=User.fromJson(userDataMap);

    }
    return currentUserInfo;



  }

  Future<void> fetchDataFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('currentUser');
    print("The datttttttttttttttttttttttttttaaaaaaaa");
    print(data);
  }
}