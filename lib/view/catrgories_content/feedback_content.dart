import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/feedback_controller.dart';
import 'package:sanskriti/utils/custom_button.dart';
import 'package:sanskriti/utils/custom_formfield.dart';

Widget feedbackContent() {
  FeedBackController feedbackController = Get.put(FeedBackController());

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Give feedback',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomFormField(
            controller: feedbackController.nameController,
            headingText: 'Name',
            hintText: 'Enter your name',
            maxLines: 1,
            obsecureText: false,
            suffixIcon: const Icon(Icons.person),
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomFormField(
            controller: feedbackController.emailController,
            headingText: 'Email',
            hintText: 'yourmail@gmail.com',
            maxLines: 1,
            obsecureText: false,
            suffixIcon: const Icon(Icons.mail),
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomFormField(
            controller: feedbackController.feedbackController,
            headingText: 'Comment, if any',
            hintText: 'Write something here....',
            maxLines: 10,
            obsecureText: false,
            suffixIcon: const Icon(Icons.comment),
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
          ),
          const SizedBox(
            height: 50,
          ),
          AuthButton(
            text: 'SEND FEEDBACK',
            onTap: () {
              feedbackController.sendFeedback(
                feedbackController.nameController.text,
                feedbackController.emailController.text,
                feedbackController.feedbackController.text,
              );
              Get.snackbar("Message", "Feedback submitted successfully");
              feedbackController.nameController.clear();
              feedbackController.emailController.clear();
              feedbackController.feedbackController.clear();
            },
          ),
        ],
      ),
    ),
  );
}
