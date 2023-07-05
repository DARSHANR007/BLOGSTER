import 'package:flutter/material.dart';



class signupimagebutton extends StatelessWidget {
  const signupimagebutton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        FractionallySizedBox(
          widthFactor:0.5,
          child: GestureDetector(
            onTap: (  ) {  },
            child: Container(
              width:30,
              padding: EdgeInsets.all(00),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(width:2,color:Colors.black)
              ),
              child: const Image(image:AssetImage('images/googlelogo.png'),
                width:300,
                height:80,

              ),
            ),
          ),
        ),
        const SizedBox(width:24,),
        FractionallySizedBox(
          widthFactor: 0.5,
          child: GestureDetector(
            onTap: (  ) {  },
            child: Container(
              width: 30,
              padding: const EdgeInsets.all(00),
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(width:2,color:Colors.black)
              ),
              child: const Image(image:AssetImage('images/applelogo.png'),
                width:300,
                height:300,

              ),
            ),
          ),
        ),
      ],
    );
  }
}
