import 'package:flutter/material.dart';


class InputField extends StatelessWidget {
 const InputField({
    Key? key,
    required this.textFieldName,
    required this.iconData, required this.controller,
  }) : super(key: key);

  final String textFieldName;
  final IconData iconData;
   final TextEditingController controller;



  @override





  Widget build(BuildContext context)


  {

    final bool isPassword =
    textFieldName.toLowerCase().contains('password');

    final obscureText= isPassword;

    return TextField(
      controller: controller,

      decoration: InputDecoration(
        labelText: textFieldName,
        prefixIcon: Icon(iconData),
        prefixIconColor: Colors.black,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:const BorderSide(width:3,color: Colors.black)
        ),

      ),

      obscureText: isPassword ? obscureText : false,
    );
  }
}
