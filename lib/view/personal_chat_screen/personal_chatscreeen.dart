import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';

class PersonalChatscreeen extends StatelessWidget {
  final String name;
  final String profileurl;
  const PersonalChatscreeen(
      {super.key, required this.name, required this.profileurl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _built_appbar_section(context),
      body: _built_first_container_section(),
      bottomSheet: _built_bottembar_section(),
    );
  }

  Container _built_bottembar_section() {
    return Container(
      height: 65,
      decoration: BoxDecoration(color: ColorsConstant.PRIMARYgreyt),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: ColorsConstant.PRIMARYwhite,
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Icon(
                  Icons.emoji_emotions_outlined,
                  color: ColorsConstant.lightblack,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    decoration: InputDecoration(
                        hintText: "Message", border: InputBorder.none),
                  ),
                ),
                Icon(
                  Icons.attachment_outlined,
                  color: ColorsConstant.lightblack,
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? photo =
                        await picker.pickImage(source: ImageSource.camera);
                  },
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: ColorsConstant.lightblack,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: ColorsConstant.PRIMARYCOLOR,
                borderRadius: BorderRadius.circular(30)),
            child: Icon(
              Icons.mic,
              size: 23,
              color: ColorsConstant.PRIMARYwhite,
            ),
          )
        ],
      ),
    );
  }

  Container _built_first_container_section() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: ColorsConstant.PRIMARYgreyt),
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 8, right: 8, bottom: 100),
        child: Column(
          children: [
            Container(
              width: 300,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: ColorsConstant.golenyellow,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(color: ColorsConstant.PRIMARYgreyt, blurRadius: 8)
                  ]),
              child: Text(
                "Messages and calls are end to end encrypted. No one outside of this chat, not even Whats App. can read or listen to them. Tap to learn more.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }

  PreferredSize _built_appbar_section(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(65),
      child: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10, left: 5),
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        leadingWidth: 20,
        title: Padding(
          padding: EdgeInsets.only(top: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(profileurl),
                  height: 45,
                  width: 45,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "time",
                      style: TextStyle(
                          fontSize: 15, color: ColorsConstant.lightblack2),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 25),
            child: Icon(
              Icons.video_call,
              size: 35,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10),
            child: Icon(
              Icons.call_outlined,
              size: 28,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10),
            child: PopupMenuButton(
              iconSize: 30,
              itemBuilder: (context) => [
                PopupMenuItem(child: Text("View contact")),
                PopupMenuItem(child: Text("Report")),
                PopupMenuItem(child: Text("Block")),
                PopupMenuItem(child: Text("Search")),
                PopupMenuItem(child: Text("Mute notification")),
                PopupMenuItem(
                  child: Text("Disappearing messages"),
                ),
                PopupMenuItem(child: Text("Wallpaper")),
                PopupMenuItem(
                    child: Row(
                  children: [
                    Text("More"),
                    Spacer(),
                    Icon(Icons.arrow_forward_sharp)
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
