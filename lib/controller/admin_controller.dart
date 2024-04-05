import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/view/Admin/admin_home.dart';
import 'package:sanskriti/view/welcome_page.dart';

class AdminController extends GetxController {
  final adminEmailController = TextEditingController();
  final adminPasswordController = TextEditingController();

  final auth = FirebaseAuth.instance;
  Future<void> adminLogin() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: adminEmailController.text,
          password: adminPasswordController.text);

      Get.snackbar(
        'Success',
        'Login Sucessfully',
      );
      //emailController.clear();
      //passwordController.clear();
      Get.offAll(const AdminHomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No Admin found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Error',
          'Please Enter valid Email!',
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      //print('Unexpected error: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again later.',
      );
    }
  }

  Future<void> adminLogout() async {
    await auth.signOut();
    Get.offAll(const WelcomePage());
  }

  List<Map<String, dynamic>> sections = [
    {
      "title": "Education",
      "image": "images/education_caticon.png",
    },
    {
      "title": "Ebooks",
      "image": "images/ebook_caticon.png",
    },
    {
      "title": "Events",
      "image": "images/event_caticon.png",
    },
    {
      "title": "Cultures",
      "image": "images/culture_caticon.png",
    },
    {
      "title": "Blogs",
      "image": "images/blogs_caticon.png",
    },
    {
      "title": "Feedbacks",
      "image": "images/feedback_caticon.png",
    },
  ];
}
