import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notifier/devotional_notifier.dart';
import '../models/models.dart';
import '../../../core/utils/colors.dart';

class DevotionalCategories extends StatelessWidget {
  const DevotionalCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DevotionalNotifier>(
      builder: (context, notifier, child) {
        if (notifier.categoriesLoading) {
          return const SizedBox(
            height: 120,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (notifier.categoriesError != null) {
          return Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                notifier.categoriesError!,
                style: TextStyle(
                  color: appColor.error,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }

        return SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: notifier.categories.length,
            itemBuilder: (context, index) {
              final category = notifier.categories[index];
              final isSelected = notifier.selectedCategoryId == category.id;
              
              return _CategoryCard(
                category: category,
                isSelected: isSelected,
                onTap: () {
                  notifier.setSelectedCategory(
                    isSelected ? null : category.id,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final DevotionalCategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? appColor.primary : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? appColor.primary : appColor.grey_200,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon placeholder (you can replace with actual images)
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: isSelected 
                    ? Colors.white.withOpacity(0.2)
                    : _getColorFromString(category.backgroundColor).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getIconForCategory(category.title),
                  color: isSelected 
                    ? Colors.white
                    : _getColorFromString(category.backgroundColor),
                  size: 18,
                ),
              ),
              const SizedBox(height: 12),
              
              Text(
                category.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : appColor.grey_900,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              
              Text(
                category.subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected 
                    ? Colors.white.withOpacity(0.8)
                    : appColor.grey_600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorFromString(String colorString) {
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xff')));
    } catch (e) {
      return appColor.primary;
    }
  }

  IconData _getIconForCategory(String title) {
    switch (title.toLowerCase()) {
      case 'daily devotions':
        return Icons.wb_sunny_outlined;
      case 'biblical studies':
        return Icons.menu_book_outlined;
      case 'prayer guide':
        return Icons.favorite_outline;
      case 'youth focus':
        return Icons.people_outline;
      default:
        return Icons.bookmark_outline;
    }
  }
}
