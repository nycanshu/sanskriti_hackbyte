import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 50),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('images/app_logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Himanshu Kumar",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ProfileDetails(
              viewicon: Icon(Icons.email),
              text: "usermail@gmail.com",
            ),
            const ProfileDetails(
              viewicon: Icon(Icons.person_2),
              text: "username",
            ),
            const ProfileDetails(
              viewicon: Icon(Icons.call),
              text: "+91 1234567891",
            ),
            const ProfileDetails(
              viewicon: Icon(Icons.password),
              text: "***********",
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final String? text;
  final Icon? viewicon;
  const ProfileDetails({
    super.key,
    this.text,
    this.viewicon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, top: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (viewicon != null) viewicon!,
          const SizedBox(
            width: 30,
          ),
          Text(
            text ?? "",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
