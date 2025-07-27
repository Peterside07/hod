import 'package:flutter/material.dart';
import '../models/user_profile_model.dart';
import '../models/devotional_model.dart';
import '../models/message_model.dart';
import '../models/video_model.dart';
import '../models/live_stream_model.dart';
import '../models/event_model.dart';
import '../data/home_repository.dart';

enum HomeViewState { idle, loading, success, error }

class HomeNotifier extends ChangeNotifier {
  final HomeRepository _repository = HomeRepository();

  // State
  HomeViewState _state = HomeViewState.idle;
  String _errorMessage = '';

  // Data
  UserProfileModel? _userProfile;
  List<DevotionalModel> _devotionals = [];
  List<MessageModel> _messages = [];
  List<VideoModel> _videos = [];
  LiveStreamModel? _liveStream;
  List<EventModel> _events = [];

  // Getters
  HomeViewState get state => _state;
  String get errorMessage => _errorMessage;
  UserProfileModel? get userProfile => _userProfile;
  List<DevotionalModel> get devotionals => _devotionals;
  List<MessageModel> get messages => _messages;
  List<VideoModel> get videos => _videos;
  LiveStreamModel? get liveStream => _liveStream;
  List<EventModel> get events => _events;

  bool get isLoading => _state == HomeViewState.loading;
  bool get hasError => _state == HomeViewState.error;
  bool get isSuccess => _state == HomeViewState.success;

  // Methods
  void _setState(HomeViewState newState) {
    _state = newState;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _setState(HomeViewState.error);
  }

  Future<void> initializeHomeData() async {
    _setState(HomeViewState.loading);
    
    try {
      // Load all data concurrently
      final results = await Future.wait([
        _repository.getUserProfile(),
        _repository.getDevotionals(),
        _repository.getMessages(),
        _repository.getVideos(),
        _repository.getLiveStream(),
        _repository.getEvents(),
      ]);

      _userProfile = results[0] as UserProfileModel;
      _devotionals = results[1] as List<DevotionalModel>;
      _messages = results[2] as List<MessageModel>;
      _videos = results[3] as List<VideoModel>;
      _liveStream = results[4] as LiveStreamModel?;
      _events = results[5] as List<EventModel>;

      _setState(HomeViewState.success);
    } catch (e) {
      _setError('Failed to load home data: ${e.toString()}');
    }
  }

  Future<void> refreshData() async {
    await initializeHomeData();
  }

  // User actions
  void onSearchTap() {
    // Navigate to search screen
    debugPrint('Search tapped');
  }

  void onFlameTap() {
    // Show flame details or streak information
    debugPrint('Flame tapped - Count: ${_userProfile?.flameCount}');
  }

  void onDevotionalTap(DevotionalModel devotional) {
    // Navigate to devotional detail
    debugPrint('Devotional tapped: ${devotional.title}');
  }

  void onMessageTap(MessageModel message) {
    // Navigate to message player
    debugPrint('Message tapped: ${message.title}');
  }

  void onVideoTap(VideoModel video) {
    // Navigate to video player
    debugPrint('Video tapped: ${video.title}');
  }

  void onDevotionalRead(DevotionalModel devotional) {
    // Mark devotional as read and navigate
    debugPrint('Reading devotional: ${devotional.title}');
  }

  void onLiveStreamTap() {
    // Navigate to live stream
    debugPrint('Live stream tapped');
  }

  void onEventTap(EventModel event) {
    // Navigate to event details
    debugPrint('Event tapped: ${event.title}');
  }

  void onSeeAllEventsTap() {
    // Navigate to all events
    debugPrint('See all events tapped');
  }
}
