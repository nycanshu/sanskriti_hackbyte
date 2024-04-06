import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/comment_model.dart'; // Importing CommentModel from the correct file
import '../model/question_model.dart';

class ChannelController extends GetxController {
  final TextEditingController question = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Function to post a question to Firestore
  Future<void> postQuestion() async {
    try {
      await _firestore.collection('questions').add({
        'question': question.text,
        'likes': 0, // Initialize likes to 0
        'comments': [], // Initialize comments as empty list
        'timestamp':
            FieldValue.serverTimestamp(), // Optional: Include timestamp
      });
      question.clear(); // Clear the text field after posting
      // Show success message
      Get.snackbar('Success', 'Question posted successfully');
    } catch (error) {
      // Show error message
      Get.snackbar('Error', 'Failed to post question: $error');
    }
  }

  // Function to add a reply to a question
  Future<void> addReplyToQuestion(String questionId, CommentModel reply) async {
    try {
      await _firestore.collection('questions').doc(questionId).update({
        'comments': FieldValue.arrayUnion([reply.toJson()]),
      });
      // Show success message
      Get.snackbar('Success', 'Reply added successfully');
    } catch (error) {
      // Show error message
      Get.snackbar('Error', 'Failed to add reply: $error');
    }
  }

  // Function to get all questions from Firestore
  Stream<List<QuestionModel>> getAllQuestions() {
    return _firestore.collection('questions').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return QuestionModel(
          id: doc.id,
          question: doc['question'],
          likes: doc['likes'] ?? 0,
          comments: (doc['comments'] as List<dynamic> ?? [])
              .map((comment) => CommentModel(
                    id: comment['id'],
                    comment: comment['comment'],
                    likes: comment['likes'] ?? 0,
                  ))
              .toList(),
        );
      }).toList();
    });
  }
}
