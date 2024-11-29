import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class NavBar extends StatefulWidget {

   NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String email= '';
  String name= "";
  void SharePrep()async{
    final sha= await SharedPreferences.getInstance();

  setState(() {
    email=sha.getString("EMAIL")!;
    name=sha.getString("namePass")!;
  });
  }
@override
  void initState() {
    // TODO: implement initState
  SharePrep();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("$name"),
              accountEmail: Text("$email"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/image9.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  // color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/images/image10.jpg"),
                      fit: BoxFit.cover))),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text(
              "Theme",
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
            onTap: () {
              Get.changeTheme(ThemeData.dark());
            },
          ),
          ListTile(
            leading: Icon(Icons.upload),
            title: Text(
              "Upload Photo",
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.picture_in_picture),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notification_add),
            title: Text(
              "Notifications",
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              "Share",
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.abc_outlined),
            title: Text(
              "About Us",
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "Logout",
              style: TextStyle(color: Colors.black.withOpacity(.7)),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
