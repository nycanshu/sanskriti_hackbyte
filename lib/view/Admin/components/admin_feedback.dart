import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/feedback_controller.dart'; // Assuming the controller is in this file

// ignore: must_be_immutable
class AdminFeedbackContainer extends StatelessWidget {
  FeedBackController feedBackController = Get.put(FeedBackController());

  AdminFeedbackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => feedBackController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: feedBackController.feedbacks.length,
                itemBuilder: (context, index) {
                  var feedback = feedBackController.feedbacks[index];
                  return ListTile(
                    title: Text(feedback.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(feedback.email),
                        Text(feedback.feedback),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
