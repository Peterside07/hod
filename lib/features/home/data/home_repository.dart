import '../models/user_profile_model.dart';
import '../models/devotional_model.dart';
import '../models/message_model.dart';
import '../models/video_model.dart';
import '../models/live_stream_model.dart';
import '../models/event_model.dart';

class HomeRepository {
  // Simulate API calls with mock data
  Future<UserProfileModel> getUserProfile() async {
    await Future.delayed(const Duration(milliseconds: 500));
    
    final mockData = {
      'name': 'Pastor Sola',
      'avatarUrl': 'https://example.com/avatar.jpg',
      'flameCount': 8,
    };
    
    return UserProfileModel.fromJson(mockData);
  }

  Future<List<DevotionalModel>> getDevotionals() async {
    await Future.delayed(const Duration(milliseconds: 800));
    
    final mockData = [
      {
        'title': 'Mercy Diet',
        'subtitle': 'Rejoice in the Lord, Always',
        'dateText': 'Today, Fri, 26 July',
        'imageUrl': 'assets/pngs/devotional1.png',
        'buttonLabel': 'Read Now',
        'category': 'Daily',
        'color': '#273472', 
      },
      {
        'title': 'Mercy',
        'subtitle': 'God\'s Grace Abounds',
        'dateText': 'Tomorrow, Sat, 27 July',
        'imageUrl': 'assets/pngs/devotional2.png',
        'buttonLabel': 'Read Now',
        'category': 'Weekly',
        'color': '#388F0E', 
      },
    ];
    
    return mockData.map((json) => DevotionalModel.fromJson(json)).toList();
  }

  Future<List<MessageModel>> getMessages() async {
    await Future.delayed(const Duration(milliseconds: 600));
    
    final mockData = [
      {
        'title': 'Things of the Spirit (Part 1)',
        'speaker': 'Pastor Sola Osunmakinde',
        'imageUrl': 'assets/pngs/message1.png',
        'duration': '45 min',
        'category': 'Sunday Service',
      },
      {
        'title': 'Seeing through God\'s Eye',
        'speaker': 'Pastor Joshua Ademuwagum',
        'imageUrl': 'assets/pngs/message2.png',
        'duration': '38 min',
        'category': 'Midweek Service',
      },
      {
        'title': 'Fully Known (Part 1)',
        'speaker': 'Pastor Daniel Osunmakinde',
        'imageUrl': 'assets/pngs/message2.png',
        'duration': '42 min',
        'category': 'Sunday Service',
      },
    ];
    
    return mockData.map((json) => MessageModel.fromJson(json)).toList();
  }

  Future<List<VideoModel>> getVideos() async {
    await Future.delayed(const Duration(milliseconds: 700));
    
    final mockData = [
      {
        'title': 'Throne Room (An  Evening of Worship with River of Life)',
        'thumbnailUrl': 'assets/pngs/video1.png',
        'videoUrl': 'assets/pngs/message2.png',
        'duration': '3:45',
        'category': 'Worship',
      },
      {
        'title': 'Sure Mercies (Second Service) | 4th August 2024',
        'thumbnailUrl': 'assets/pngs/devotional2.png',
        'videoUrl': 'assets/pngs/message2.png',
        'duration': '1:32:15',
        'category': 'Live Service',
      },
    ];
    
    return mockData.map((json) => VideoModel.fromJson(json)).toList();
  }

  Future<LiveStreamModel?> getLiveStream() async {
    await Future.delayed(const Duration(milliseconds: 400));
    
    final mockData = {
      'title': 'Mercy Moments with Pastor Sola Osunmakinde - Mercy Still Speaks',
      'subtitle': '(22 July 2024)',
      'imageUrl': 'assets/pngs/live_stream.png',
      'viewerCount': 2,
      'isLive': true,
      
    };
    
    return LiveStreamModel.fromJson(mockData);
  }

  Future<List<EventModel>> getEvents() async {
    await Future.delayed(const Duration(milliseconds: 900));
    
    final mockData = [
      {
        'title': 'The Man, His Ministry and His Mission',
        'subtitle': 'A Special Event',
        'imageUrl': 'assets/pngs/event1.png',
        'startDate': '2024-06-01T10:00:00Z',
        'endDate': '2024-09-02T18:00:00Z',
        'startTime': '10:00AM',
        'location': 'Main Auditorium',
      },
      {
        'title': 'The Man, His Ministry and His Mission',
        'subtitle': 'Follow-up Session',
        'imageUrl': 'assets/pngs/event2.png',
        'startDate': '2024-06-01T10:00:00Z',
        'endDate': '2024-09-02T18:00:00Z',
        'startTime': '10:00AM',
        'location': 'Conference Hall',
      },
    ];
    
    return mockData.map((json) => EventModel.fromJson(json)).toList();
  }
}
