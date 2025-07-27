import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notifier/devotional_notifier.dart';
import '../../../core/utils/colors.dart';

class DevotionalDetailView extends StatefulWidget {
  final String devotionalId;
  
  const DevotionalDetailView({
    super.key,
    required this.devotionalId,
  });

  @override
  State<DevotionalDetailView> createState() => _DevotionalDetailViewState();
}

class _DevotionalDetailViewState extends State<DevotionalDetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DevotionalNotifier>().loadDevotionalDetail(widget.devotionalId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DevotionalNotifier>(
      builder: (context, notifier, child) {
        if (notifier.devotionalLoading) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (notifier.devotionalError != null) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notifier.devotionalError!,
                    style: TextStyle(
                      color: appColor.error,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => notifier.loadDevotionalDetail(widget.devotionalId),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        final devotional = notifier.currentDevotional;
        if (devotional == null) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: const Center(
              child: Text('Devotional not found'),
            ),
          );
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              // Header with background image and title
              SliverAppBar(
                expandedHeight: 300,
                floating: false,
                pinned: true,
                backgroundColor: appColor.primary,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      devotional.isBookmarked 
                        ? Icons.bookmark 
                        : Icons.bookmark_outline,
                      color: Colors.white,
                    ),
                    onPressed: () => notifier.toggleBookmark(devotional.id),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    devotional.date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background image (you can replace with actual image)
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              appColor.primary.withValues(alpha: 0.8),
                              appColor.primary,
                            ],
                          ),
                        ),
                      ),
                      // Positioned title and scripture reference
                      Positioned(
                        bottom: 80,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              devotional.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              devotional.verseReference,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // Memory Verse Section
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0F8FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: appColor.primary.withValues(alpha:  0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.lightbulb_outline,
                                    color: appColor.primary,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'MEMORY VERSE',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: appColor.primary,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '"${devotional.verse}" ${devotional.verseReference}',
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: appColor.grey_900,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Main Content
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          devotional.content,
                          style: TextStyle(
                            fontSize: 16,
                            color: appColor.grey_800,
                            height: 1.6,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Prayer Point Section
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: appColor.primary.withValues(alpha: 0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.favorite_outline,
                                    color: appColor.primary,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  'PRAYER POINT',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: appColor.primary,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              devotional.prayer,
                              style: TextStyle(
                                fontSize: 16,
                                color: appColor.grey_900,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
