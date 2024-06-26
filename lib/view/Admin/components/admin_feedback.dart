import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/feedback_controller.dart';

import '../../../helper/feedback_card.dart'; // Assuming the controller is in this file

// ignore: must_be_immutable
class AdminFeedbackContainer extends StatelessWidget {
  FeedBackController feedBackController = Get.put(FeedBackController());

  AdminFeedbackContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => feedBackController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: feedBackController.feedbacks.length,
                      itemBuilder: (context, index) {
                        var feedback = feedBackController.feedbacks[index];
                        return FeedbackCard(
                          name: feedback.name,
                          email: feedback.email,
                          feedbackmsg: feedback.feedback,
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
