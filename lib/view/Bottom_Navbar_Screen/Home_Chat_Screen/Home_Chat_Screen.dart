import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';
import 'package:new_version_whatsap/utils/Constants/DataBase_Constants.dart';
import 'package:new_version_whatsap/view/Bottom_Navbar_Screen/Home_Chat_Screen/widgets/homescreen_tile.dart';
import 'package:new_version_whatsap/view/Settings_screen/Settings_Screen.dart';

class HomeChatScreen extends StatelessWidget {
  HomeChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar_section(),
      body: _body_section(),
    );
  }

  Container _body_section() {
    return Container(
        color: ColorsConstant.PRIMARYwhite,
        child: SingleChildScrollView(
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                _text_field_section(),
                _tab_bar_section(),
                SizedBox(
                  height: 10,
                ),
                _builder_section(),
              ],
            ),
          ),
        ));
  }

  ListView _builder_section() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: DatabaseConstant.database.length,
      itemBuilder: (context, index) => home_screen_tile(
        time: DatabaseConstant.database[index]['time'],
        profilePicurl: DatabaseConstant.database[index]['profilePic'],
        message: DatabaseConstant.database[index]['message'],
        name: DatabaseConstant.database[index]['name'],
      ),
    );
  }

  Padding _tab_bar_section() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          TabBar(
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicator: BoxDecoration(
                  // shape: BoxShape.rectangle,
                  color: ColorsConstant.PRIMARYCOLOR,
                  borderRadius: BorderRadius.circular(20)),
              tabs: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text("All"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text("Unread"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text("Favorites"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text("Groups"),
                ),
              ]),
        ],
      ),
    );
  }

  Widget _text_field_section() {
    return Container(
      decoration: BoxDecoration(
          color: ColorsConstant.PRIMARYgreyt.withOpacity(.2),
          borderRadius: BorderRadius.circular(50)),
      margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15),
            prefixIcon: Icon(Icons.search),
            hintText: "Ask Meta AI or Search",
            border: InputBorder.none),
      ),
    );
  }

  AppBar appbar_section() {
    return AppBar(
      title: Text(
        "whatsapp",
        style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: ColorsConstant.PRIMARYCOLOR),
      ),
      backgroundColor: ColorsConstant.PRIMARYwhite,
      actions: [
        Icon(Icons.qr_code_scanner_sharp),
        SizedBox(
          width: 15,
        ),
        Icon(
          Icons.camera_alt_outlined,
        ),
        SizedBox(
          width: 9,
        ),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(child: Text("New group")),
            PopupMenuItem(child: Text("New Broadcast")),
            PopupMenuItem(child: Text("Linked divice")),
            PopupMenuItem(child: Text("Starred messages")),
            PopupMenuItem(child: Text("Payments")),
            PopupMenuItem(
              child: Text("Settings"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(),
                    ));
              },
            ),
            PopupMenuItem(child: Text("Switch Account")),
          ],
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
