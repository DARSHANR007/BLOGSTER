import 'package:app_auth/App%20auth/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Profile page.dart';
import 'apiServices.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> articlelist = [];
  TextEmailController textEmailController = TextEmailController();
  late String x = '';
  late String y = '';

  int _selectedIndex = 0;

  ApiServices apiServices = ApiServices();

  void profiledata() {
    setState(() {
      x = textEmailController.emailController.text;
      y = textEmailController.textController.text;
    });
  }

  void fetchdata() async {
    List<Map<String, dynamic>> datalist = await apiServices.getArticles();
    setState(() {
      articlelist =
          datalist.map((item) => {...item, 'isBookmarked': false}).toList();
    });
  }

  void toggleBookmark(int index) {
    setState(() {
      articlelist[index]['isBookmarked'] = !articlelist[index]['isBookmarked'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "B L O G S T E R",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var item = articlelist[index];
          var title = item['title'] ?? '';
          var description = item['description'] ?? '';
          var social_image = item['social_image'] ?? '';
          var url = item['url'] ?? '';

          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                launchURL(url);
              },
              child: ExpansionTile(
                title: Text(
                  title,
                  style: GoogleFonts.rubik(fontSize: 20),
                ),
                children: [
                  Container(
                    width: 400,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Image.network(social_image),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      description,
                      style: GoogleFonts.rubik(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: articlelist.length,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.white.withOpacity(.1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 200),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.white,
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.search,
                text: 'Search',
              ),
              GButton(
                icon: LineIcons.bookmark,
                text: 'Bookmarks',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                if (index == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        ProfilePage(name: x, email: y, password: y)),
                  );
                }
              });
            },
          ),
        ),
      ),
    );
  }

}