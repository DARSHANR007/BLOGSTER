
import 'package:app_auth/App%20auth/image_Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class loginPage extends StatefulWidget {
   loginPage({Key? key, required this.showRegisterpage}) : super(key: key);

   final VoidCallback showRegisterpage;

  @override
  State<loginPage> createState() => _loginPageState();
}
class _loginPageState extends State<loginPage> {
   final _emailController=TextEditingController();

   final _passwordController=TextEditingController();
  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email:_emailController.text, password:_passwordController.text );

   }

   void dispose()
   {
     _emailController.dispose();
     _passwordController.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 30, left: 10),
                  child: Image(
                    image: AssetImage('images/chatterlogo.png'),
                    width: 300,
                    height:300,
                  )),
              const SizedBox(
                height:15,
              ),
              const Center(
                  child: Text(
                "Welcome back,You were missed",
                style: TextStyle(fontSize: 20),
              )),
              const SizedBox(
                height: 15,
              ),
               Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _emailController,
                    decoration:const InputDecoration(
                        label: Text("email"),
                      prefixIcon:Icon(MdiIcons.email),
                      enabledBorder:OutlineInputBorder(
                        borderSide:BorderSide(color: Colors.white,width: 3),
                        borderRadius:BorderRadius.horizontal(left:Radius.circular(20),right:Radius.circular(20) )
                      )
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
               Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration:const InputDecoration(
                      label: Text("password"),
                        prefixIcon:Icon(MdiIcons.formTextboxPassword),
                        enabledBorder:OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.white,width: 3),
                            borderRadius:BorderRadius.horizontal(left:Radius.circular(20),right:Radius.circular(20) )
                        )
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          "Forgot Password",
                          style: GoogleFonts.roboto(
                              fontSize: 18, color: Colors.blueAccent,fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(height:10,),
                  ],
                ),
              ),
              GestureDetector(
                onTap:signIn,
                child: Container(
                  height:60,
                  width:250,
                  decoration:BoxDecoration(
                    color:Colors.black,
                    borderRadius: BorderRadius.circular(10),),
                  child: Center(child: Text("Sign In",style:GoogleFonts.roboto(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold),)),

                ),
              ),
              const SizedBox(height:20,),
              Text("Or continue with",style: GoogleFonts.roboto(fontSize:18,fontWeight:FontWeight.bold),),
              const SizedBox(height:25,),
              const Padding(padding:EdgeInsets.only(left:30),child: image_Button()),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: Text(
                      "First time.",
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                        child: GestureDetector(
                          onTap:widget.showRegisterpage,
                          child: Text("Register here",
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent)),
                        )),
                  ],)
                ],
              )

          ,
          ),
        );
  }
}


class TextEmailController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  String get email => emailController.text;
  String get password => textController.text;

  void disposeControllers() {
    emailController.dispose();
    textController.dispose();
  }
}
