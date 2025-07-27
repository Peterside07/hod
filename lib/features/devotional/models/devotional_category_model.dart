class DevotionalCategoryModel {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String backgroundColor;
  final int totalDevotionals;
  final int dayCount;

  DevotionalCategoryModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.backgroundColor,
    this.totalDevotionals = 0,
    required this.dayCount,
  });

  factory DevotionalCategoryModel.fromJson(Map<String, dynamic> json) {
    return DevotionalCategoryModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      backgroundColor: json['backgroundColor'] ?? '',
      totalDevotionals: json['totalDevotionals'] ?? 0,
      dayCount: json['dayCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'backgroundColor': backgroundColor,
      'totalDevotionals': totalDevotionals,
      'dayCount': dayCount,
    };
  }
}
