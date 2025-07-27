import 'package:flutter/foundation.dart';
import '../models/models.dart';
import '../data/devotional_repository.dart';

class DevotionalNotifier extends ChangeNotifier {
  final DevotionalRepository _repository = DevotionalRepository();

  // Categories state
  List<DevotionalCategoryModel> _categories = [];
  bool _categoriesLoading = false;
  String? _categoriesError;

  // Timeline state
  List<DevotionalTimelineModel> _timeline = [];
  bool _timelineLoading = false;
  String? _timelineError;

  // Current devotional detail state
  DevotionalDetailModel? _currentDevotional;
  bool _devotionalLoading = false;
  String? _devotionalError;

  // Bookmarked devotionals state
  List<DevotionalDetailModel> _bookmarkedDevotionals = [];
  bool _bookmarkedLoading = false;
  String? _bookmarkedError;

  // Selected category filter
  String? _selectedCategoryId;

  // Getters
  List<DevotionalCategoryModel> get categories => _categories;
  bool get categoriesLoading => _categoriesLoading;
  String? get categoriesError => _categoriesError;

  List<DevotionalTimelineModel> get timeline => _timeline;
  bool get timelineLoading => _timelineLoading;
  String? get timelineError => _timelineError;

  DevotionalDetailModel? get currentDevotional => _currentDevotional;
  bool get devotionalLoading => _devotionalLoading;
  String? get devotionalError => _devotionalError;

  List<DevotionalDetailModel> get bookmarkedDevotionals => _bookmarkedDevotionals;
  bool get bookmarkedLoading => _bookmarkedLoading;
  String? get bookmarkedError => _bookmarkedError;

  String? get selectedCategoryId => _selectedCategoryId;

  // Filtered timeline based on selected category
  List<DevotionalTimelineModel> get filteredTimeline {
    if (_selectedCategoryId == null) return _timeline;
    // In a real app, you would filter based on category
    return _timeline;
  }

  // Load devotional categories
  Future<void> loadCategories() async {
    _categoriesLoading = true;
    _categoriesError = null;
    notifyListeners();

    try {
      _categories = await _repository.getDevotionalCategories();
      _categoriesError = null;
    } catch (e) {
      _categoriesError = 'Failed to load categories: ${e.toString()}';
    } finally {
      _categoriesLoading = false;
      notifyListeners();
    }
  }

  // Load devotional timeline
  Future<void> loadTimeline() async {
    _timelineLoading = true;
    _timelineError = null;
    notifyListeners();

    try {
      _timeline = await _repository.getDevotionalTimeline();
      _timelineError = null;
    } catch (e) {
      _timelineError = 'Failed to load timeline: ${e.toString()}';
    } finally {
      _timelineLoading = false;
      notifyListeners();
    }
  }

  // Load specific devotional detail
  Future<void> loadDevotionalDetail(String id) async {
    _devotionalLoading = true;
    _devotionalError = null;
    notifyListeners();

    try {
      _currentDevotional = await _repository.getDevotionalDetail(id);
      _devotionalError = null;
    } catch (e) {
      _devotionalError = 'Failed to load devotional: ${e.toString()}';
    } finally {
      _devotionalLoading = false;
      notifyListeners();
    }
  }

  // Load bookmarked devotionals
  Future<void> loadBookmarkedDevotionals() async {
    _bookmarkedLoading = true;
    _bookmarkedError = null;
    notifyListeners();

    try {
      _bookmarkedDevotionals = await _repository.getBookmarkedDevotionals();
      _bookmarkedError = null;
    } catch (e) {
      _bookmarkedError = 'Failed to load bookmarked devotionals: ${e.toString()}';
    } finally {
      _bookmarkedLoading = false;
      notifyListeners();
    }
  }

  // Toggle bookmark status
  Future<void> toggleBookmark(String devotionalId) async {
    try {
      final isBookmarked = await _repository.toggleBookmark(devotionalId);
      
      // Update current devotional if it's the one being bookmarked
      if (_currentDevotional?.id == devotionalId) {
        _currentDevotional = DevotionalDetailModel(
          id: _currentDevotional!.id,
          title: _currentDevotional!.title,
          author: _currentDevotional!.author,
          content: _currentDevotional!.content,
          date: _currentDevotional!.date,
          verse: _currentDevotional!.verse,
          verseReference: _currentDevotional!.verseReference,
          reflection: _currentDevotional!.reflection,
          prayer: _currentDevotional!.prayer,
          keyPoints: _currentDevotional!.keyPoints,
          audioUrl: _currentDevotional!.audioUrl,
          duration: _currentDevotional!.duration,
          isBookmarked: isBookmarked,
          category: _currentDevotional!.category,
        );
      }

      // Reload bookmarked devotionals to update the list
      loadBookmarkedDevotionals();
      
      notifyListeners();
    } catch (e) {
      // Handle error silently or show a snackbar
      debugPrint('Failed to toggle bookmark: ${e.toString()}');
    }
  }

  // Mark devotional as completed
  Future<void> markAsCompleted(String devotionalId) async {
    try {
      await _repository.markAsCompleted(devotionalId);
      
      // Update the timeline item to show as completed
      final index = _timeline.indexWhere((item) => item.id == devotionalId);
      if (index != -1) {
        _timeline[index] = DevotionalTimelineModel(
          id: _timeline[index].id,
          title: _timeline[index].title,
          subtitle: _timeline[index].subtitle,
          description: _timeline[index].description,
          date: _timeline[index].date,
          time: _timeline[index].time,
          dayOfWeek: _timeline[index].dayOfWeek,
          month: _timeline[index].month,
          year: _timeline[index].year,
          isCompleted: true,
          audioUrl: _timeline[index].audioUrl,
          duration: _timeline[index].duration,
        );
      }
      
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to mark as completed: ${e.toString()}');
    }
  }

  // Set selected category filter
  void setSelectedCategory(String? categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }

  // Clear current devotional
  void clearCurrentDevotional() {
    _currentDevotional = null;
    _devotionalError = null;
    notifyListeners();
  }

  // Refresh all data
  Future<void> refreshAll() async {
    await Future.wait([
      loadCategories(),
      loadTimeline(),
      loadBookmarkedDevotionals(),
    ]);
  }

  // Initialize data
  Future<void> init() async {
    await refreshAll();
  }
}
