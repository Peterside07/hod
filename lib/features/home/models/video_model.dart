class VideoModel {
  final String title;
  final String thumbnailUrl;
  final String videoUrl;
  final String duration;
  final String category;

  VideoModel({
    required this.title,
    required this.thumbnailUrl,
    required this.videoUrl,
    this.duration = '',
    this.category = '',
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      title: json['title'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
      duration: json['duration'] ?? '',
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'thumbnailUrl': thumbnailUrl,
      'videoUrl': videoUrl,
      'duration': duration,
      'category': category,
    };
  }
}
