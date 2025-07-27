class UserProfileModel {
  final String name;
  final String avatarUrl;
  final int flameCount;

  UserProfileModel({
    required this.name,
    required this.avatarUrl,
    required this.flameCount,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      name: json['name'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      flameCount: json['flameCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
      'flameCount': flameCount,
    };
  }
}
