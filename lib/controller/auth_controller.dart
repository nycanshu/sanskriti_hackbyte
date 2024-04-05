import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/view/sign_in.dart';

import '../view/home_screen.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userName = TextEditingController();

//signup code
  void signupUser() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.snackbar(
        'Success',
        'Account Created Successfully',
      );

      Get.offAll(const Signin());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'Email id already in use!',
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Error',
          'Please Enter valid Email!',
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

  //login code
  void loginUser() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      Get.snackbar(
        'Success',
        'Login Sucessfully',
      );
      emailController.clear();
      passwordController.clear();
      Get.offAll(const HomePage());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
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

  //log out code
  void logOut() async {
    await auth.signOut();
    //Get.offAll(const Signin());
  }
}
