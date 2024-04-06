import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sanskriti/model/feedbackModel.dart';

class FeedBackController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final feedbackController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxBool isLoading = false.obs;
  final RxList<FeedbackModel> feedbacks = <FeedbackModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch feedbacks when the controller is initialized
    getFeedbacks();
  }

  Future<void> sendFeedback(String name, String email, String feedback) async {
    if (name.isEmpty || email.isEmpty || feedback.isEmpty) {
      // Show error message if any of the fields are empty
      Get.snackbar('Error', 'All fields are required');
      return;
    }
    FeedbackModel newFeedback = FeedbackModel(
      name: name,
      email: email,
      feedback: feedback,
    );

    try {
      isLoading.value = true; // Show loading indicator
      await _firestore
          .collection('feedbacks')
          .add(newFeedback.toFirebaseJson());
    } catch (e) {
      // Handle error, e.g., show an error message
      print('Error sending feedback: $e');
    } finally {
      isLoading.value =
          false; // Hide loading indicator regardless of success or failure
    }
  }

  Future<void> getFeedbacks() async {
    try {
      isLoading.value = true; // Show loading indicator
      QuerySnapshot querySnapshot =
          await _firestore.collection('feedbacks').get();
      feedbacks.assignAll(
        querySnapshot.docs.map((doc) {
          return FeedbackModel(
            name: doc['name'],
            email: doc['email'],
            feedback: doc['feedback'],
          );
        }).toList(),
      );
    } catch (e) {
      // Handle error, e.g., show an error message
      print('Error getting feedbacks: $e');
    } finally {
      isLoading.value =
          false; // Hide loading indicator regardless of success or failure
    }
  }
}
