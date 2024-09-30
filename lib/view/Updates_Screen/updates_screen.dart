import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_version_whatsap/global_widgets/updates_tile.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';
import 'package:new_version_whatsap/utils/Constants/DataBase_Constants.dart';
import 'package:new_version_whatsap/view/Settings_screen/Settings_Screen.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _built_appbar_section(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Status',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _built_myprofile_section(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Recent updates',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              _built_builder_section()
            ],
          ),
        ),
      ),
      floatingActionButton: _built_floating_action_section(),
    );
  }

  Row _built_myprofile_section() {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              color: ColorsConstant.PRIMARYwhite,
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(DatabaseConstant.myprofile),
                  height: 45,
                  width: 45,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: CircleAvatar(
                backgroundColor: ColorsConstant.PRIMARYCOLOR,
                radius: 12,
                child: Icon(
                  Icons.add,
                  color: ColorsConstant.PRIMARYwhite,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My status",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorsConstant.PRIMARYblack),
            ),
            Text("Tap to add status update")
          ],
        )
      ],
    );
  }

  Stack _built_floating_action_section() {
    return Stack(
      children: [
        Positioned(
          bottom: 80,
          right: 10,
          child: FloatingActionButton(
            backgroundColor: Colors.grey,
            onPressed: () {},
            child: Icon(Icons.edit),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? photo =
                  await picker.pickImage(source: ImageSource.camera);
            },
            child: Icon(Icons.camera_alt),
          ),
        ),
      ],
    );
  }

  ListView _built_builder_section() {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => update_tile(
              imageurl: DatabaseConstant.updatetile[index]["profile"],
              name: DatabaseConstant.updatetile[index]["name"],
              time: DatabaseConstant.updatetile[index]["time"],
              statusprofile: DatabaseConstant.updatetile[index]
                  ["statusprofile"],
            ),
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemCount: DatabaseConstant.updatetile.length);
  }
}

AppBar _built_appbar_section() {
  return AppBar(
    title: Text(
      'Updates',
      style: TextStyle(
        fontSize: 24,
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
          PopupMenuItem(child: Text("Status privacy")),
          PopupMenuItem(child: Text("Create channel")),
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
