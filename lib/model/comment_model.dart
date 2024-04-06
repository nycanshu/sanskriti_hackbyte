class CommentModel {
  final String id;
  final String comment;
  int likes;

  CommentModel({
    required this.id,
    required this.comment,
    required this.likes,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment': comment,
      'likes': likes,
    };
  }
}
