import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/community_controller.dart';
import 'package:sanskriti/helper/question_ui.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(
            AlertDialog(
              title: const Text('Ask a Question'),
              content: TextField(
                controller: ChannelController.to.question,
                decoration:
                    const InputDecoration(hintText: 'Enter your question'),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Get.back(); // Close the dialog
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    final String question = ChannelController.to.question.text;
                    if (question.isNotEmpty) {
                      ChannelController.to.postQuestion();
                      Get.back(); // Close the dialog
                    } else {
                      Get.snackbar('Error', 'Please enter a question.');
                    }
                  },
                  child: const Text('Post Question'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/community.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Positioned(
                top: 70,
                left: 20,
                child: Text(
                  "Welcome to the",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Positioned(
                bottom: 20,
                left: 20,
                child: Text(
                  "Community Page",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          // Search box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search any question...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<ChannelController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.questions.length,
                  itemBuilder: (context, index) {
                    final question = controller.questions[index];
                    return QuestionUi(
                      question: question.question,
                      timeStamp: question.timestamp,
                      likeButton: IconButton(
                        icon: const Icon(Icons.thumb_up),
                        onPressed: () {
                          // Implement like functionality
                        },
                      ),
                      commentButton: IconButton(
                        icon: const Icon(Icons.comment),
                        onPressed: () {
                          // Implement comment functionality
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
