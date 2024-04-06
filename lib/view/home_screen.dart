import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/auth_controller.dart';
import 'package:sanskriti/utils/app_colors.dart';
import 'package:sanskriti/view/drawer_pages/general_info.dart';
import 'package:sanskriti/view/profile_page.dart';
import 'package:sanskriti/view/welcome_page.dart';
import '../dialogflow/Chat_Module/ChatBot.dart';
import '../utils/text_styles.dart';
import '../yuvaraj_screen/add_post_screen.dart';
import '../yuvaraj_screen/feed_screen.dart';
import 'explore_page.dart';

import 'homepageContent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Declare _currentIndex as an instance variable

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    final List<Widget> _pages = [
      const HomePageContent(),
      const ExplorePage(),
      const ProfilePage(),
      // CommunityScreen(),
      const FeedScreen(),
      const AddPostScreen(),
      ChatBotScreen()
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('SansKriti', style: KTextStyle.homeHeaderTextStyle),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.lightsky,
        leading: IconButton(
          onPressed: () {
            openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: AppColors.black,
            size: 30,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: IconButton(
              onPressed: () {
                authController.logOut();
                Get.offAll(WelcomePage());
                //function to logout
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: AppColors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        // Add your drawer content here
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.lightsky,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/bhagwat_gita.png'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    authController.userName.text,
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text(
                "General Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.to(const GeneralInfo());
                // Update the state of the app
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_history),
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text(
                'National Identity Elements',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.place),
              title: const Text(
                'State/UTs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text(
                'Districts of India',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text(
                'Indian and World Geography',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'ChatBot',
          ),
        ],
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.black,
      ),
      body: _pages[_currentIndex],
    );
  }
}