import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';

class update_tile extends StatelessWidget {
  const update_tile({
    super.key,
    required this.name,
    required this.time,
    required this.imageurl,
  });
  final String name;
  final String time;
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConstant.PRIMARYwhite,
      height: 75,
      width: 390,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: ColorsConstant.PRIMARYCOLOR, width: 6),
                borderRadius: BorderRadius.circular(50)),
            child: CircleAvatar(
              child: Image.network(fit: BoxFit.fill, imageurl),
              radius: 25,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Text(
                time,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }
}
