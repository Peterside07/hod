import '../models/models.dart';

class DevotionalRepository {
  static final DevotionalRepository _instance = DevotionalRepository._internal();
  
  factory DevotionalRepository() {
    return _instance;
  }
  
  DevotionalRepository._internal();

  // Simulate API delay
  Future<void> _delay() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<List<DevotionalCategoryModel>> getDevotionalCategories() async {
    await _delay();
    
    return [
      DevotionalCategoryModel(
        id: '1',
        title: 'Mercy Diet',
        subtitle: 'Daily devotional for adults by\nHousehold of David',
        imageUrl: 'assets/pngs/mercy_diet_adult.png',
        backgroundColor: '#4A90E2',
        totalDevotionals: 365,
        dayCount: 24,
      ),
      DevotionalCategoryModel(
        id: '2',
        title: 'Mercy Diet (Teens)',
        subtitle: 'Daily devotional for teens by\nHousehold of David',
        imageUrl: 'assets/pngs/mercy_diet_teens.png',
        backgroundColor: '#50C878',
        totalDevotionals: 365,
        dayCount: 24,
      ),
      DevotionalCategoryModel(
        id: '3',
        title: 'Mercy Diet (Kids)',
        subtitle: 'Daily devotional for kids by\nHousehold of David',
        imageUrl: 'assets/pngs/mercy_diet_kids.png',
        backgroundColor: '#FF6B6B',
        totalDevotionals: 365,
        dayCount: 24,
      ),
    ];
  }

  Future<List<DevotionalTimelineModel>> getDevotionalTimeline() async {
    await _delay();
    
    return [
      DevotionalTimelineModel(
        id: '1',
        title: 'The Great Helper',
        subtitle: '"So then it is not of him that wills..." - Rom 9:16',
        description: 'Today we explore the great helper that God has provided for us in our spiritual journey.',
        date: '26th',
        time: '5-10 mins',
        dayOfWeek: 'Wed.',
        month: 'June',
        year: '2024',
        isCompleted: false,
        audioUrl: 'assets/audio/devotional_1.mp3',
        duration: 8,
      ),
      DevotionalTimelineModel(
        id: '2',
        title: 'Our Defender and Shield',
        subtitle: '"So then it is not of him that wills..." - Rom 9:16',
        description: 'Understanding how God defends and protects us in our daily walk.',
        date: '25th',
        time: '5-10 mins',
        dayOfWeek: 'Tues.',
        month: 'June',
        year: '2024',
        isCompleted: true,
        audioUrl: 'assets/audio/devotional_2.mp3',
        duration: 6,
      ),
      DevotionalTimelineModel(
        id: '3',
        title: 'Nothing Missing, Nothing Broken',
        subtitle: '"So then it is not of him that wills..." - Rom 9:16',
        description: 'God\'s plan for completeness and wholeness in our lives.',
        date: '24th',
        time: '5-10 mins',
        dayOfWeek: 'Mon.',
        month: 'June',
        year: '2024',
        isCompleted: true,
        audioUrl: 'assets/audio/devotional_3.mp3',
        duration: 7,
      ),
      DevotionalTimelineModel(
        id: '4',
        title: 'Alpha and Omega',
        subtitle: '"So then it is not of him that wills..." - Rom 9:16',
        description: 'Understanding God as the beginning and the end of all things.',
        date: '23rd',
        time: '5-10 mins',
        dayOfWeek: 'Sun.',
        month: 'June',
        year: '2024',
        isCompleted: true,
        audioUrl: 'assets/audio/devotional_4.mp3',
        duration: 5,
      ),
      DevotionalTimelineModel(
        id: '5',
        title: 'River of Life',
        subtitle: '"So then it is not of him that wills..." - Rom 9:16',
        description: 'Flowing in the river of God\'s life and blessings.',
        date: '22nd',
        time: '5-10 mins',
        dayOfWeek: 'Sat.',
        month: 'June',
        year: '2024',
        isCompleted: true,
        audioUrl: 'assets/audio/devotional_5.mp3',
        duration: 9,
      ),
    ];
  }

  Future<DevotionalDetailModel> getDevotionalDetail(String id) async {
    await _delay();
    
    // Mock detailed devotional based on ID
    switch (id) {
      case '1':
        return DevotionalDetailModel(
          id: '1',
          title: 'The Great Helper',
          author: 'Household of David',
          content: '''Lorem ipsum dolor sit amet consectetur. Tellus neque posuere urna a enim interdum. Amet fermentum diam donec justo facilisi interdum.

Posuere nam a vulputate amet. Leo vitae molestie quam turpis pellentesque pharetra quis. Morbi quam pellentesque tincidunt cursus imperdiet turpis adipiscing nunc commentum.

Posuere nam a vulputate amet. Leo vitae molestie quam turpis pellentesque pharetra quis.''',
          date: 'Wed. 26th June 2024',
          verse: 'So then it is not of him that wills, nor of him that runs, but of God who shows mercy.',
          verseReference: 'Romans 9:16',
          reflection: 'Take time to reflect on how God\'s mercy has been evident in your life. Consider the ways He has shown kindness when you least deserved it.',
          prayer: 'Dear Lord, in Your mercy, I receive help for my life, family, career, ministry, and finances.',
          keyPoints: [
            'God\'s mercy is not based on our efforts',
            'Divine help comes through God\'s grace',
            'We can trust in God\'s perfect timing',
            'Mercy covers all areas of our lives'
          ],
          audioUrl: 'assets/audio/devotional_1.mp3',
          duration: 8,
          isBookmarked: false,
          category: 'Mercy Diet',
        );
      case '2':
        return DevotionalDetailModel(
          id: '2',
          title: 'Gods Love Never Fails',
          author: 'Pastor Sarah Johnson',
          content: '''God's love is the foundation of everything He does. Unlike human love, which can be conditional and fleeting, God's love is constant, unconditional, and eternal.

This love isn't based on our performance or worthiness. It flows from His very nature - because God IS love. His love for us doesn't increase when we're good or decrease when we fail.

Understanding this truth transforms how we see ourselves and others. When we truly grasp the depth of God's love, we stop striving to earn it and start living from the security it provides.

This love also empowers us to love others well. We can love the difficult people in our lives because we're loved by God. We can forgive because we've been forgiven.''',
          date: 'December 16, 2024',
          verse: 'But God demonstrates his own love for us in this: While we were still sinners, Christ died for us.',
          verseReference: 'Romans 5:8',
          reflection: '''How does knowing that God's love is unconditional change the way you see yourself? How can this truth impact your relationships with others today?

Consider the people in your life who are difficult to love. How might God's love flowing through you change these relationships?''',
          prayer: '''Loving Father, thank You for Your unfailing love. Help me to truly understand and experience the depth of Your love for me. Fill my heart with Your love so that I can love others as You have loved me. Show me how to extend grace and forgiveness to those around me. In Jesus' name, Amen.''',
          keyPoints: [
            'God\'s love is constant and unconditional',
            'His love isn\'t based on our performance',
            'Understanding God\'s love brings security',
            'God\'s love empowers us to love others',
            'We can forgive because we\'ve been forgiven'
          ],
          audioUrl: 'assets/audio/devotional_2.mp3',
          duration: 6,
          isBookmarked: false,
          category: 'Daily Devotions',
        );
      default:
        return DevotionalDetailModel(
          id: id,
          title: 'Sample Devotional',
          author: 'Pastor Sample',
          content: 'This is a sample devotional content.',
          date: 'December 17, 2024',
          verse: 'For I know the plans I have for you, declares the Lord, plans to prosper you and not to harm you, to give you hope and a future.',
          verseReference: 'Jeremiah 29:11',
          reflection: 'Reflect on God\'s goodness in your life.',
          prayer: 'Dear God, thank You for Your love and guidance. Amen.',
          keyPoints: ['Trust in God', 'His plans are good'],
          audioUrl: 'assets/audio/devotional_sample.mp3',
          duration: 5,
          isBookmarked: false,
          category: 'Daily Devotions',
        );
    }
  }

  Future<List<DevotionalDetailModel>> getBookmarkedDevotionals() async {
    await _delay();
    
    // Return devotionals that are bookmarked
    // For now, return empty list as no devotionals are bookmarked by default
    return [];
  }

  Future<bool> toggleBookmark(String devotionalId) async {
    await _delay();
    
    // Simulate toggling bookmark
    // In a real app, this would update the server and return the new bookmark status
    return true;
  }

  Future<void> markAsCompleted(String devotionalId) async {
    await _delay();
    
    // Simulate marking devotional as completed
    // In a real app, this would update the server
  }
}
