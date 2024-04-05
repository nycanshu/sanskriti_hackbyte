class FeedbackModel {
  String name;
  String email;
  String feedback;

  FeedbackModel({
    required this.name,
    required this.email,
    required this.feedback,
  });

  Map<String, dynamic> toFirebaseJson() {
    return {
      'name': name,
      'email': email,
      'feedback': feedback,
    };
  }
}
