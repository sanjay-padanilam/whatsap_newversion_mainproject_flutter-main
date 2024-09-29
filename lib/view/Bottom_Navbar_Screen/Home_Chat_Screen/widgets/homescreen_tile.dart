import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';
import 'package:new_version_whatsap/view/personal_chat_screen/personal_chatscreeen.dart';

class home_screen_tile extends StatelessWidget {
  final String profilePicurl;
  final String message;
  final String name;
  final String time;

  home_screen_tile(
      {super.key,
      required this.message,
      required this.name,
      required this.time,
      required this.profilePicurl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PersonalChatscreeen(
                name: name,
                profileurl: profilePicurl,
              ),
            ));
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profilePicurl),
        radius: 28,
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: ColorsConstant.PRIMARYgreyt),
      ),
      trailing: Column(
        children: [
          Text(time),
          SizedBox(height: 6),
          CircleAvatar(
            backgroundColor: ColorsConstant.PRIMARYCOLOR,
            radius: 12,
            child: Text(
              "1",
              style: TextStyle(
                  color: ColorsConstant.PRIMARYwhite,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
