import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';
import 'package:new_version_whatsap/view/Settings_screen/Settings_Screen.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _built_appbar_section(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Favorite",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: ColorsConstant.darkgreen,
                  child: Icon(
                    Icons.favorite,
                    color: ColorsConstant.PRIMARYwhite,
                    size: 20,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Add favorite',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'To start calling contacts who have WhatsApp, tap 📞 at the bottom of your screen.',
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(Icons.add_call),
      ),
    );
  }

  AppBar _built_appbar_section() {
    return AppBar(
      title: Text(
        'Calls',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: ColorsConstant.PRIMARYblack,
        ),
      ),
      backgroundColor: ColorsConstant.PRIMARYwhite,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.qr_code),
          color: ColorsConstant.PRIMARYblack,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.camera_alt),
          color: ColorsConstant.PRIMARYblack,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.search),
          color: ColorsConstant.PRIMARYblack,
          onPressed: () {},
        ),
        PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(child: Text("Clear call log")),
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
