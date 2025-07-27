class DevotionalTimelineModel {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String date;
  final String time;
  final String dayOfWeek;
  final String month;
  final String year;
  final bool isCompleted;
  final String? audioUrl;
  final int duration; // in minutes

  DevotionalTimelineModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.date,
    required this.time,
    required this.dayOfWeek,
    required this.month,
    required this.year,
    this.isCompleted = false,
    this.audioUrl,
    this.duration = 5,
  });

  factory DevotionalTimelineModel.fromJson(Map<String, dynamic> json) {
    return DevotionalTimelineModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      description: json['description'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      dayOfWeek: json['dayOfWeek'] ?? '',
      month: json['month'] ?? '',
      year: json['year'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
      audioUrl: json['audioUrl'],
      duration: json['duration'] ?? 5,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'date': date,
      'time': time,
      'dayOfWeek': dayOfWeek,
      'month': month,
      'year': year,
      'isCompleted': isCompleted,
      'audioUrl': audioUrl,
      'duration': duration,
    };
  }
}
