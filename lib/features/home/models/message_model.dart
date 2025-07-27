class MessageModel {
  final String title;
  final String speaker;
  final String imageUrl;
  final String duration;
  final String category;

  MessageModel({
    required this.title,
    required this.speaker,
    required this.imageUrl,
    this.duration = '',
    this.category = '',
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      title: json['title'] ?? '',
      speaker: json['speaker'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      duration: json['duration'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'speaker': speaker,
      'imageUrl': imageUrl,
      'duration': duration,
      'category': category,
    };
  }
}
