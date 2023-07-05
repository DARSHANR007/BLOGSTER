import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ArticleBox extends StatefulWidget {
  const ArticleBox({Key? key, required this.title,   }) : super(key: key);


  final String title;




  @override
  State<ArticleBox> createState() => _ArticleBoxState();
}

class _ArticleBoxState extends State<ArticleBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Container(
            width: 400,
            height:400,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: CircleAvatar(
                        child: Icon(Icons.flutter_dash), // social image parameter
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                      child: Text(widget.title,
                        style: GoogleFonts.rubik(fontSize: 20,),textAlign:TextAlign.left,

                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left:20, top: 10),
                  child: Text(
                    "4-7-2020 - ReadTime-5 min",
                    style: GoogleFonts.rubik(fontSize: 15),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width:400,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.grey.shade900,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Center(
                    child: Text("image"), // thumbnail image to be placed here
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left:350, top: 10),
                  child: Icon(Icons.bookmark),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
