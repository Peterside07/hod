class DevotionalDetailModel {
  final String id;
  final String title;
  final String author;
  final String content;
  final String date;
  final String verse;
  final String verseReference;
  final String reflection;
  final String prayer;
  final List<String> keyPoints;
  final String? audioUrl;
  final int duration; // in minutes
  final bool isBookmarked;
  final String category;

  DevotionalDetailModel({
    required this.id,
    required this.title,
    required this.author,
    required this.content,
    required this.date,
    required this.verse,
    required this.verseReference,
    required this.reflection,
    required this.prayer,
    required this.keyPoints,
    this.audioUrl,
    this.duration = 5,
    this.isBookmarked = false,
    required this.category,
  });

  factory DevotionalDetailModel.fromJson(Map<String, dynamic> json) {
    return DevotionalDetailModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      date: json['date'] ?? '',
      verse: json['verse'] ?? '',
      verseReference: json['verseReference'] ?? '',
      reflection: json['reflection'] ?? '',
      prayer: json['prayer'] ?? '',
      keyPoints: List<String>.from(json['keyPoints'] ?? []),
      audioUrl: json['audioUrl'],
      duration: json['duration'] ?? 5,
      isBookmarked: json['isBookmarked'] ?? false,
      category: json['category'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'content': content,
      'date': date,
      'verse': verse,
      'verseReference': verseReference,
      'reflection': reflection,
      'prayer': prayer,
      'keyPoints': keyPoints,
      'audioUrl': audioUrl,
      'duration': duration,
      'isBookmarked': isBookmarked,
      'category': category,
    };
  }
}
