import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class buttonsignin extends StatelessWidget {
  const buttonsignin({Key? key, required this.onTap}) : super(key: key);

 final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
       height:60,
        width:250,
        decoration:BoxDecoration(
          color:Colors.black,
          borderRadius: BorderRadius.circular(10),),
          child: Center(child: Text("Sign In",style:GoogleFonts.roboto(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold),)),

      ),
    );
  }
}
