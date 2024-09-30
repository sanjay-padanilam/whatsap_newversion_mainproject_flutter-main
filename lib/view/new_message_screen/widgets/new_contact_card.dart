import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';
import 'package:new_version_whatsap/view/personal_chat_screen/personal_chatscreeen.dart';

class new_contact_card extends StatelessWidget {
  const new_contact_card({
    super.key,
    required this.profile,
    required this.name,
  });
  final String profile;
  final String name;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PersonalChatscreeen(name: name, profileurl: profile),
            ));
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          fit: BoxFit.cover,
          profile,
          height: 45,
          width: 45,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
            color: ColorsConstant.PRIMARYblack,
            fontWeight: FontWeight.w500,
            fontSize: 15),
      ),
      subtitle: Text(
        "Heey there i am using Whatsapp.",
        style: TextStyle(
            color: ColorsConstant.PRIMARYgreyt,
            fontWeight: FontWeight.w500,
            fontSize: 14),
      ),
    );
  }
}
