import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';
import 'package:new_version_whatsap/utils/Constants/DataBase_Constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Build_appbar_Section(),
      body: _build_profile_section(),
    );
  }

  Widget _build_profile_section() {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(DatabaseConstant.myprofile),
              height: 70,
              width: 60,
            ),
          ),
          title: Text(
            'My name',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            'Hey there! I am using WhatsApp...',
            style: TextStyle(fontSize: 16),
          ),
          trailing: Icon(Icons.qr_code),
        ),
        Divider(),
        Build_settings_icons_tile(
            Icons.key, 'Account', 'Security notifications, change number'),
        Build_settings_icons_tile(
            Icons.lock, 'Privacy', 'Block contacts, disappearing messages'),
        Build_settings_icons_tile(
            Icons.person, 'Avatar', 'Create, edit, profile photo'),
        Build_settings_icons_tile(
            Icons.favorite, 'Favorites', 'Add, reorder, remove'),
        Build_settings_icons_tile(
            Icons.chat, 'Chats', 'Theme, wallpaper, chat history'),
        Build_settings_icons_tile(Icons.notifications, 'Notifications',
            'Message, group & call tones'),
        Build_settings_icons_tile(Icons.data_usage, 'Storage and Data',
            'Network usage, auto-download'),
        Build_settings_icons_tile(
            Icons.language, 'App Language', 'English (device\'s language)'),
        Build_settings_icons_tile(
            Icons.help, 'Help', 'Help center, contact us, privacy policy'),
        Build_settings_icons_tile(Icons.group, "Invite a friend", ""),
        Build_settings_icons_tile(
            Icons.security_update_good_outlined, "Invite a friend", ""),
      ],
    );
  }

  AppBar Build_appbar_Section() {
    return AppBar(
      title: Text('Settings'),
      backgroundColor: Colors.white,
    );
  }

  Widget Build_settings_icons_tile(
      IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: ColorsConstant.PRIMARYblack),
      title: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 14, color: ColorsConstant.PRIMARYgreyt),
      ),
    );
  }
}
