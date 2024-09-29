import 'package:flutter/material.dart';
import 'package:new_version_whatsap/utils/Constants/Colors_Constants.dart';
import 'package:new_version_whatsap/view/Bottom_Navbar_Screen/Home_Chat_Screen/Home_Chat_Screen.dart';
import 'package:new_version_whatsap/view/Call_screen/call_screen.dart';
import 'package:new_version_whatsap/view/Updates_Screen/updates_screen.dart';
import 'package:new_version_whatsap/view/community_screen/communityscreen.dart';

class BottomNavbarScreen extends StatefulWidget {
  const BottomNavbarScreen({super.key});

  @override
  State<BottomNavbarScreen> createState() => _BottomNavbarScreenState();
}

class _BottomNavbarScreenState extends State<BottomNavbarScreen> {
  List screens = [
    HomeChatScreen(),
    UpdatesScreen(),
    Communityscreen(),
    CallScreen(),
  ];

  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: ColorsConstant.PRIMARYCOLOR,
        selectedIndex: selectedindex,
        onDestinationSelected: (value) {
          selectedindex = value;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.chat),
            icon: Icon(Icons.chat_outlined),
            label: "Chats",
          ),
          NavigationDestination(icon: Icon(Icons.update), label: "Updates"),
          NavigationDestination(icon: Icon(Icons.group), label: "Communities"),
          NavigationDestination(icon: Icon(Icons.call), label: "Calls"),
        ],
      ),
      body: screens[selectedindex],
    );
  }
}
