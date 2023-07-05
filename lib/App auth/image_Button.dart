import 'package:flutter/material.dart';



class image_Button extends StatelessWidget {
  const image_Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: [
          GestureDetector(
            onTap: (  ) {  },
            child: Container(
               width:125,
              height:75,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(width:4,color:Colors.black)
              ),
              child: const Image(image:AssetImage('images/googlelogo.png'),
                width:100,
                height:100,

              ),
            ),
          ),
          const SizedBox(width:5,),
          GestureDetector(
            onTap: (  ) {  },
            child: Container(
              width:125,
              height:75,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(width:4,color:Colors.black)
              ),
              child: const Image(image:AssetImage('images/applelogo.png'),
                width:100,
                height:100,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
