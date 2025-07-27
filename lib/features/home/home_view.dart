import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifier/home_notifier.dart';
import 'widgets/greeting_header.dart';
import 'widgets/live_stream_widget.dart';
import 'widgets/devotional_section.dart';
import 'widgets/messages_section.dart';
import 'widgets/videos_section.dart';
import 'widgets/events_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeNotifier>().initializeHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Consumer<HomeNotifier>(
        builder: (context, homeNotifier, child) {
          if (homeNotifier.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (homeNotifier.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.red.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Something went wrong',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    homeNotifier.errorMessage,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => homeNotifier.refreshData(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => homeNotifier.refreshData(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50), // Status bar padding
                  
                  // Greeting Header
                  if (homeNotifier.userProfile != null)
                    GreetingHeader(
                      user: homeNotifier.userProfile!,
                      onSearchTap: homeNotifier.onSearchTap,
                      onFlameTap: homeNotifier.onFlameTap,
                    ),

                  const SizedBox(height: 20),

                  // Live Stream Section
                  LiveStreamWidget(
                    liveStream: homeNotifier.liveStream,
                    onTap: homeNotifier.onLiveStreamTap,
                  ),
                  const SizedBox(height: 32),

                  // Devotional Section
                  if (homeNotifier.devotionals.isNotEmpty) ...[
                    DevotionalSection(
                      devotionals: homeNotifier.devotionals,
                      onDevotionalTap: homeNotifier.onDevotionalTap,
                      onReadTap: homeNotifier.onDevotionalRead,
                    ),
                    const SizedBox(height: 32),
                  ],

                  // Messages Section
                  if (homeNotifier.messages.isNotEmpty) ...[
                    MessagesSection(
                      messages: homeNotifier.messages,
                      onMessageTap: homeNotifier.onMessageTap,
                    ),
                    const SizedBox(height: 32),
                  ],

                  // Videos Section
                  if (homeNotifier.videos.isNotEmpty) ...[
                    VideosSection(
                      videos: homeNotifier.videos,
                      onVideoTap: homeNotifier.onVideoTap,
                    ),
                    const SizedBox(height: 32),
                  ],

                  // Events Section
                  if (homeNotifier.events.isNotEmpty) ...[
                    EventsSection(
                      events: homeNotifier.events,
                      onEventTap: homeNotifier.onEventTap,
                      onSeeAllTap: homeNotifier.onSeeAllEventsTap,
                    ),
                    const SizedBox(height: 32),
                  ],

                  // Bottom padding
                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
