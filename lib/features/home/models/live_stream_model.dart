class LiveStreamModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final int viewerCount;
  final bool isLive;

  LiveStreamModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.viewerCount,
    this.isLive = true,
  });

  factory LiveStreamModel.fromJson(Map<String, dynamic> json) {
    return LiveStreamModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      viewerCount: json['viewerCount'] ?? 0,
      isLive: json['isLive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'viewerCount': viewerCount,
      'isLive': isLive,
    };
  }
}
