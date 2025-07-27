class EventModel {
  final String title;
  final String subtitle;
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final String startTime;
  final String location;

  EventModel({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    this.location = '',
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      startTime: json['startTime'] ?? '',
      location: json['location'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'startTime': startTime,
      'location': location,
    };
  }

  String get formattedDateRange {
    if (startDate.day == endDate.day && 
        startDate.month == endDate.month && 
        startDate.year == endDate.year) {
      return '${startDate.day} ${_getMonthName(startDate.month)}. ${startDate.year}';
    }
    return '${startDate.day} ${_getMonthName(startDate.month)}. - ${endDate.day} ${_getMonthName(endDate.month)}. ${endDate.year}';
  }

  String _getMonthName(int month) {
    const months = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                   'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'];
    return months[month];
  }
}
