import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';
import 'package:new_version_whatsap/utils/Constants/DataBase_Constants.dart';
import 'package:new_version_whatsap/view/new_message_screen/widgets/new_contact_card.dart';

class NewMessageScreen extends StatelessWidget {
  const NewMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: build_appbar_section(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Build_header_section(),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [Text("Contacts on whatsapp")],
                    ),
                  ),
                ],
              ),
              _build_builder_section()
            ],
          ),
        ),
      ),
    );
  }

  Column _build_builder_section() {
    return Column(
      children: List.generate(
        DatabaseConstant.newcontactlist.length,
        (index) => new_contact_card(
            profile: DatabaseConstant.newcontactlist[index]["profile"],
            name: DatabaseConstant.newcontactlist[index]["name"]),
      ),
    );
  }

  AppBar build_appbar_section(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsConstant.PRIMARYwhite,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back)),
      title: Column(
        children: [
          Text(
            "Select Contact",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "255 contacts",
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
      leadingWidth: 27,
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        PopupMenuButton(
          itemBuilder: (context) => [],
        )
      ],
    );
  }

  Column Build_header_section() {
    return Column(
      children: [
        header_tile(
            Icon(
              Icons.group_add,
              color: ColorsConstant.PRIMARYwhite,
            ),
            "New group"),
        Row(
          children: [
            Expanded(
              child: header_tile(
                  Icon(
                    Icons.person_add,
                    color: ColorsConstant.PRIMARYwhite,
                  ),
                  "New contact"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.qr_code),
            )
          ],
        ),
        header_tile(
            Icon(
              Icons.group,
              color: ColorsConstant.PRIMARYwhite,
            ),
            "New Community")
      ],
    );
  }

  ListTile header_tile(Icon icon, String titttle) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: ColorsConstant.PRIMARYCOLOR,
        radius: 20,
        child: icon,
      ),
      title: Text(titttle),
    );
  }
}
