import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class QuestionUi extends StatelessWidget {
  final String question;
  final Timestamp timeStamp;
  final IconButton likeButton;
  final IconButton commentButton;

  const QuestionUi({
    Key? key,
    required this.question,
    required this.timeStamp,
    required this.likeButton,
    required this.commentButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert Firestore Timestamp to DateTime
    DateTime dateTime = timeStamp.toDate();
    // Format DateTime as a string
    String formattedTime =
        '${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("images/anonymous.png"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anonymous',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    formattedTime,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              question,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  likeButton,
                  const SizedBox(width: 5),
                  Text('Like'),
                ],
              ),
              Row(
                children: [
                  commentButton,
                  const SizedBox(width: 5),
                  Text('Comment'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
