import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hodtech/core/shared/button/primary_button.dart';
import 'package:hodtech/core/utils/colors.dart';
import '../models/devotional_model.dart';

class DevotionalCard extends StatelessWidget {
  final DevotionalModel devotional;
  final VoidCallback onTap;
  final VoidCallback? onReadTap;

  const DevotionalCard({
    super.key,
    required this.devotional,
    required this.onTap,
    this.onReadTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardColor = _getColorFromString(devotional.color);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with icon and title
              Row(
                children: [
                  Image.asset(
                    'assets/pngs/devotional.png',
                    height: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    devotional.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Image and content row
              Row(
                children: [
                  // Image placeholder
                  if (devotional.imageUrl.isNotEmpty)
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(devotional.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          devotional.subtitle,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Colors.white70,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              devotional.dateText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.white70,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              // Read button
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  onPressed: onReadTap ?? onTap,
                  label: devotional.buttonLabel,
                  color: Colors.white,
                  textColor: appColor.primary_800,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorFromString(String colorString) {
    if (colorString.isEmpty) return const Color(0xFF4A5568);

    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return const Color(0xFF4A5568); // Default navy blue
    }
  }
}

class DevotionalSection extends StatelessWidget {
  final List<DevotionalModel> devotionals;
  final Function(DevotionalModel) onDevotionalTap;
  final Function(DevotionalModel)? onReadTap;

  const DevotionalSection({
    super.key,
    required this.devotionals,
    required this.onDevotionalTap,
    this.onReadTap,
  });

  @override
  Widget build(BuildContext context) {
    if (devotionals.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: devotionals.length,
        itemBuilder: (context, index) {
          final devotional = devotionals[index];
          return DevotionalCard(
            devotional: devotional,
            onTap: () => onDevotionalTap(devotional),
            onReadTap: onReadTap != null ? () => onReadTap!(devotional) : null,
          );
        },
      ),
    );
  }
}
