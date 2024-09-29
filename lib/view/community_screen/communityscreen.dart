import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';
import 'package:new_version_whatsap/view/Settings_screen/Settings_Screen.dart';

class Communityscreen extends StatelessWidget {
  const Communityscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buit_appbar_section(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            _buit_asset_image_Section(),
            SizedBox(height: 20),
            first_text_section(),
            SizedBox(height: 10),
            second_text_section(),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: third_text_section(),
            ),
            SizedBox(height: 30),
            button_Section(),
          ],
        ),
      ),
    );
  }

  ElevatedButton button_Section() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConstant.darkgreen,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        'Start your community',
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  Text third_text_section() {
    return Text(
      'See example communities',
      style: TextStyle(
        fontSize: 16,
        color: ColorsConstant.PRIMARYblack,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text second_text_section() {
    return Text(
      'Communities bring members together in topic-based groups, and make it easy to get admin announcements. Any community you’re added to will appear here.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ColorsConstant.PRIMARYblack,
      ),
    );
  }

  Text first_text_section() {
    return Text(
      "Stay connected with a community",
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: ColorsConstant.PRIMARYblack),
    );
  }

  Container _buit_asset_image_Section() {
    return Container(
      color: Colors.white,
      height: 150,
      child: Image.asset(
          "assets/images/WhatsApp Image 2024-09-13 at 14.30.56_5bef43b2.jpg"),
    );
  }

  AppBar buit_appbar_section() {
    return AppBar(
      backgroundColor: ColorsConstant.PRIMARYwhite,
      centerTitle: false,
      title: Text(
        "Communities",
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: ColorsConstant.PRIMARYblack),
      ),
      actions: [
        Icon(Icons.qr_code_scanner),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.camera_alt),
        SizedBox(
          width: 5,
        ),
        PopupMenuButton(
          itemBuilder: (context) => [
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
      ],
    );
  }
}
