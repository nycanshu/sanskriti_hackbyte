import 'comment_model.dart';

class QuestionModel {
  final String id;
  final String question;
  final List<CommentModel> comments;
  int likes;

  QuestionModel({
    required this.id,
    required this.question,
    required this.comments,
    required this.likes,
  });

  // Method to add a reply to the question
}
