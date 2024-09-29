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
      appBar: build_appbar_section(context),
      body: status_view_section(),
    );
  }

  Column status_view_section() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 600,
          width: double.infinity,
          child: Image(image: NetworkImage(widget.imageurl)),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }

  AppBar build_appbar_section(BuildContext context) {
    return AppBar(
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
                borderRadius: BorderRadius.circular(50),
                child: Image(
                    height: 50,
                    width: 50,
                    image: NetworkImage(widget.profile))),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    widget.time,
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
          padding: EdgeInsets.only(top: 10, right: 10),
          child: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
