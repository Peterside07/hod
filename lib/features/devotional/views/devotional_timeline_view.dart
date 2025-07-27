import 'package:flutter/material.dart';
import 'package:hodtech/core/shared/button/primary_button.dart';
import 'package:provider/provider.dart';
import '../notifier/devotional_notifier.dart';
import '../../../core/utils/colors.dart';

class DevotionalTimelineView extends StatefulWidget {
  static const String routeName = '/devotional-timeline';
  final dynamic category;
  
  const DevotionalTimelineView({
    super.key,
    required this.category,
  });

  @override
  State<DevotionalTimelineView> createState() => _DevotionalTimelineViewState();
}

class _DevotionalTimelineViewState extends State<DevotionalTimelineView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DevotionalNotifier>().loadTimeline();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appColor.grey_900),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.category.title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: appColor.grey_900,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today, color: appColor.grey_900),
            onPressed: () {
              // Calendar functionality
            },
          ),
          Image.asset(
            'assets/pngs/bookmark.png',
            height: 24,
          ),
          const SizedBox(width: 16),
    
        ],
      ),
      body: Consumer<DevotionalNotifier>(
        builder: (context, notifier, child) {
          if (notifier.timelineLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (notifier.timelineError != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notifier.timelineError!,
                    style: TextStyle(
                      color: appColor.error,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                    onPressed: () => notifier.loadTimeline(),
                    label: 'Retry',
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: notifier.timeline.length,
            itemBuilder: (context, index) {
              final devotional = notifier.timeline[index];
              return _TimelineCard(
                devotional: devotional,
                isFirst: index == 0,
                onTap: () => _navigateToDetail(context, devotional.id),
              );
            },
          );
        },
      ),
    );
  }

  void _navigateToDetail(BuildContext context, String devotionalId) {
    Navigator.pushNamed(
      context,
      '/devotional-detail',
      arguments: devotionalId,
    );
  }
}

class _TimelineCard extends StatelessWidget {
  final dynamic devotional;
  final bool isFirst;
  final VoidCallback onTap;

  const _TimelineCard({
    required this.devotional,
    required this.isFirst,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline left side with date and line
          SizedBox(
            width: 75,
            child: Column(
              children: [
                // Date display
                Column(
                  children: [
                    Text(
                      devotional.dayOfWeek,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: appColor.grey_600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      devotional.date,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: appColor.grey_900,
                      ),
                    ),
                    Text(
                      devotional.month,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        color: appColor.grey_600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Completion indicator
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: devotional.isCompleted ? appColor.white : Colors.white,
                    border: Border.all(
                      color: devotional.isCompleted ? appColor.primary : appColor.grey_500,
                    ),
                  ),
                  child: devotional.isCompleted
                    ? Icon(
                        Icons.check,
                        color: appColor.primary,
                        size: 14,
                      )
                    : null,
                ),
                
                // Timeline line (except for last item)
                if (!_isLastItem()) ...[
                  Container(
                    width: 1,
                    height: 60,
                    color: isFirst ? appColor.grey_200 : appColor.primary,
                    margin: const EdgeInsets.only(top: 8),
                  ),
                ],
              ],
            ),
          ),
          
          const SizedBox(width: 20),
          
          // Content card
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color : Colors.white,
                  borderRadius: BorderRadius.circular(12),
                
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Today badge
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            devotional.title,
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: 16,
                              color: appColor.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (isFirst) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFFE8E9),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:  Text(
                              'Today',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 12,
                                color: appColor.error,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Subtitle/verse
                    Text(
                      devotional.subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: appColor.grey_600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Duration and bookmark
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: appColor.grey_500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          devotional.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: appColor.grey_500,
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/pngs/bookmark.png',
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isLastItem() {
    // This would need context to determine if it's the last item
    // For now, return false to show line for all items except we could check index
    return false;
  }
}
