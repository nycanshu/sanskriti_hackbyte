import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:sanskriti/utils/app_colors.dart";
import "package:sanskriti/view/sign_in.dart";
import "package:sanskriti/view/sign_up.dart";

import "Admin/admin_login.dart";

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 350,
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                "images/app_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            const Text(
              "SansKriti",
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                wordSpacing: 1,
                height: 2,
              ),
            ),
            const Text(
              "Birdging Tradition and Technology",
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                wordSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              textAlign: TextAlign.center,
              "Welcome to Sanskriti,\n A platform to learn and explore the ancient Indian culture and tradition.",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            InkWell(
              onTap: () {
                Get.offAll(const AdminLogin());
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 10,
                decoration: const BoxDecoration(
                  color: AppColors.lightblue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Log In as Admin",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            //sign in container
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.offAll(const Signin());
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 10,
                decoration: const BoxDecoration(
                  color: AppColors.lightblue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Log In as User",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Dont have a account ? "),
                InkWell(
                  onTap: () {
                    Get.to(const SignUp());
                  },
                  child: const Text(
                    "Register Here",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
