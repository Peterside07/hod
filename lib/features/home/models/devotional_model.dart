class DevotionalModel {
  final String title;
  final String subtitle;
  final String dateText;
  final String imageUrl;
  final String buttonLabel;
  final String category;
  final String color;

  DevotionalModel({
    required this.title,
    required this.subtitle,
    required this.dateText,
    required this.imageUrl,
    required this.buttonLabel,
    this.category = '',
    this.color = '',
  });

  factory DevotionalModel.fromJson(Map<String, dynamic> json) {
    return DevotionalModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      dateText: json['dateText'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      buttonLabel: json['buttonLabel'] ?? '',
      category: json['category'] ?? '',
      color: json['color'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'dateText': dateText,
      'imageUrl': imageUrl,
      'buttonLabel': buttonLabel,
      'category': category,
      'color': color,
    };
  }
}
