import 'package:flutter/material.dart';
import 'package:hodtech/core/shared/button/primary_button.dart';
import 'package:provider/provider.dart';
import '../notifier/devotional_notifier.dart';
import '../models/models.dart';
import '../../../core/utils/colors.dart';

class DevotionalTimeline extends StatelessWidget {
  const DevotionalTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DevotionalNotifier>(
      builder: (context, notifier, child) {
        if (notifier.timelineLoading) {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if (notifier.timelineError != null) {
          return SliverToBoxAdapter(
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      notifier.timelineError!,
                      style: TextStyle(
                        color: appColor.error,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      onPressed: () => notifier.loadTimeline(),
                      label:  ('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (notifier.filteredTimeline.isEmpty) {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'No devotionals available',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final devotional = notifier.filteredTimeline[index];
              return _TimelineItem(
                devotional: devotional,
                onTap: () => _navigateToDetail(context, devotional.id),
                onMarkComplete: () => notifier.markAsCompleted(devotional.id),
              );
            },
            childCount: notifier.filteredTimeline.length,
          ),
        );
      },
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

class _TimelineItem extends StatelessWidget {
  final DevotionalTimelineModel devotional;
  final VoidCallback onTap;
  final VoidCallback onMarkComplete;

  const _TimelineItem({
    required this.devotional,
    required this.onTap,
    required this.onMarkComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date section
          SizedBox(
            width: 70,
            child: Column(
              children: [
                // Date circle
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: devotional.isCompleted 
                      ? appColor.success 
                      : appColor.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: (devotional.isCompleted 
                          ? appColor.success 
                          : appColor.primary).withValues(alpha:0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        devotional.date,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        devotional.dayOfWeek,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white.withValues(alpha:0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                // Timeline line
                if (!_isLastItem()) ...[
                  const SizedBox(height: 8),
                  Container(
                    width: 2,
                    height: 30,
                    color: appColor.grey_200,
                  ),
                ],
              ],
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Content section
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: appColor.grey_200,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha:0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                devotional.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: appColor.grey_900,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                devotional.subtitle,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: appColor.grey_600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        // Duration and status
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: appColor.primary.withValues(alpha:0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${devotional.duration} min',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: appColor.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            
                            if (devotional.isCompleted)
                              Icon(
                                Icons.check_circle,
                                color: appColor.success,
                                size: 20,
                              )
                            else
                              GestureDetector(
                                onTap: onMarkComplete,
                                child: Icon(
                                  Icons.radio_button_unchecked,
                                  color: appColor.grey_500,
                                  size: 20,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 12),
                    
                    Text(
                      devotional.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: appColor.grey_600,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 12),
                    
                    Row(
                      children: [
                        Text(
                          devotional.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: appColor.grey_500,
                          ),
                        ),
                        const SizedBox(width: 16),
                        if (devotional.audioUrl != null)
                          Row(
                            children: [
                              Icon(
                                Icons.headphones,
                                size: 14,
                                color: appColor.grey_500,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Audio available',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: appColor.grey_500,
                                ),
                              ),
                            ],
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
    // For now, return false to show line for all items
    return false;
  }
}
