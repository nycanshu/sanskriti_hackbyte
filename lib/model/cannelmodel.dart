class ChannelModel {
  final String name;
  final String description;

  ChannelModel({required this.name, required this.description});

  // Convert ChannelModel to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }

  // Factory constructor to create a ChannelModel instance from a map
  factory ChannelModel.fromMap(Map<String, dynamic> map) {
    return ChannelModel(
      name: map['name'],
      description: map['description'],
    );
  }
}
