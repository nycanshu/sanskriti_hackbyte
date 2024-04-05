import 'package:flutter/material.dart';

class FeedbackAdmin extends StatelessWidget {
  const FeedbackAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold is a layout for the major Material Components.
      appBar: AppBar(
        title: const Text('Feedbacks'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Center(
        child: Text('No content available for this category'),
      ),
    );
  }
}
