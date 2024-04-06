class ChannelModel {
  final String name;
  final String description;
  final String adminID;

  ChannelModel({
    required this.name,
    required this.description,
    required this.adminID,
  });

  // Convert ChannelModel to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'admin_id': adminID,
    };
  }

  // Factory constructor to create a ChannelModel instance from a map
  factory ChannelModel.fromMap(Map<String, dynamic> map) {
    return ChannelModel(
      name: map['name'],
      description: map['description'],
      adminID: map['admin_id'],
    );
  }
}
