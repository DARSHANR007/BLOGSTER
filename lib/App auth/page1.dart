import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  State<homePage> createState() => _homePageState();

  final user = FirebaseAuth.instance.currentUser!;
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const GNav(
          backgroundColor: Colors.black,
          activeColor: Colors.white,
          color: Colors.white,
          tabBackgroundGradient: LinearGradient(colors:[ Colors.blue,Colors.green]),
          tabBorderRadius:200,
          style:GnavStyle.google,
          tabs: [
            GButton(
              icon:LineIcons.search,
              text: "home1",
            ),
            GButton(icon: MdiIcons.danceBallroom, text: "Text2"),
            GButton(
              icon: LineIcons.home,
              text: "TExt3",
            ),
            GButton(
              icon: LineIcons.save,
              text: "TExt3",
            )
          ]),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(50),
          child: IconButton(
            onPressed: () {
              widget.signOut();
            },
            icon: const Icon(MdiIcons.backspace),
            color: Colors.black,
          ),
        ),
        Center(
          child: Text("YOU ARE LOGGED IN AS ${widget.user.email!}"),
        )
      ]),
    );
  }
}
