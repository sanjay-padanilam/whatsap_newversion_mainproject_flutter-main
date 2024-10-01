import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';

class StatusViewScreen extends StatefulWidget {
  const StatusViewScreen(
      {super.key,
      required this.imageurl,
      required this.name,
      required this.time,
      required this.profile});
  final String imageurl;
  final String name;
  final String time;
  final String profile;

  @override
  State<StatusViewScreen> createState() => _StatusViewScreenState();
}

class _StatusViewScreenState extends State<StatusViewScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 10)).then(
      (value) => Navigator.pop(context),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.darkblack,
      appBar: build_appbar_section(context),
      body: status_view_section(),
    );
  }

  Column status_view_section() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 600,
            width: double.infinity,
            child: Image(image: NetworkImage(widget.imageurl)),
          ),
        ),
        Spacer(),
        bottom_bar_section(),
      ],
    );
  }

  Container bottom_bar_section() {
    return Container(
      height: 65,
      decoration: BoxDecoration(color: ColorsConstant.darkblack),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
            decoration: BoxDecoration(
                color: ColorsConstant.PRIMARYgreyt,
                borderRadius: BorderRadius.circular(30)),
            child: Container(
              width: 290,
              child: TextFormField(
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: ColorsConstant.PRIMARYwhite),
                  hintText: "Replay",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: ColorsConstant.PRIMARYCOLOR,
                borderRadius: BorderRadius.circular(30)),
            child: Icon(
              Icons.favorite,
              size: 23,
              color: ColorsConstant.PRIMARYwhite,
            ),
          )
        ],
      ),
    );
  }

  AppBar build_appbar_section(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsConstant.darkblack,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 5),
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: ColorsConstant.PRIMARYwhite,
          ),
        ),
      ),
      leadingWidth: 30,
      title: Padding(
        padding: EdgeInsets.only(top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                    image: NetworkImage(widget.profile))),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 20, color: ColorsConstant.PRIMARYwhite),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.time,
                    style: TextStyle(
                        fontSize: 15, color: ColorsConstant.PRIMARYwhite),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        PopupMenuButton(
          iconColor: ColorsConstant.PRIMARYwhite,
          itemBuilder: (context) => [
            PopupMenuItem(child: Text("Mute")),
            PopupMenuItem(child: Text("Message")),
            PopupMenuItem(child: Text("Voice call")),
            PopupMenuItem(child: Text("Vedio call")),
            PopupMenuItem(child: Text("View contact")),
            PopupMenuItem(
              child: Text("Report"),
            ),
          ],
        ),
      ],
    );
  }
}
