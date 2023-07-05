

import 'package:app_auth/App%20auth/loginpage.dart';
import 'package:app_auth/App%20auth/signup.dart';
import 'package:flutter/material.dart';



class authPage extends StatefulWidget {
  const authPage({Key? key}) : super(key: key);

  @override
  State<authPage> createState() => _authPageState();
}

bool showloginpage=true;


class _authPageState extends State<authPage> {


  void toggleScreen(){
    setState(() {
      showloginpage=!showloginpage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showloginpage) {
      return loginPage(showRegisterpage:toggleScreen);
    }
    else {
      return signup(showloginpage:toggleScreen);
    }
  }
}
