import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notifier/devotional_notifier.dart';
import '../../../core/utils/colors.dart';

class DevotionalView extends StatefulWidget {
  const DevotionalView({super.key});

  @override
  State<DevotionalView> createState() => _DevotionalViewState();
}

class _DevotionalViewState extends State<DevotionalView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DevotionalNotifier>().loadCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Text(
              'Devotional',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: appColor.grey_900,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.local_fire_department,
                      color: appColor.primary_400,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '24',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: appColor.primary_400,
                          ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<DevotionalNotifier>(
        builder: (context, notifier, child) {
          if (notifier.categoriesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (notifier.categoriesError != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    notifier.categoriesError!,
                    style: TextStyle(
                      color: appColor.error,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => notifier.loadCategories(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: ListView.builder(
              itemCount: notifier.categories.length,
              itemBuilder: (context, index) {
                final category = notifier.categories[index];
                return _DevotionalCategoryCard(
                  category: category,
                  onTap: () => _navigateToTimeline(context, category),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _navigateToTimeline(BuildContext context, category) {
    Navigator.pushNamed(
      context,
      '/devotional-timeline',
      arguments: category,
    );
  }
}

class _DevotionalCategoryCard extends StatelessWidget {
  final dynamic category;
  final VoidCallback onTap;

  const _DevotionalCategoryCard({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Category Image
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade100,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    category.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: _getColorFromString(category.backgroundColor)
                              .withOpacity( 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          _getIconForCategory(category.title),
                          color: _getColorFromString(category.backgroundColor),
                          size: 30,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Category Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: appColor.grey_900,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: appColor.grey_600,
                          ),
                    ),
                  ],
                ), 
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
    if (title.toLowerCase().contains('teens')) {
      return Icons.people_outline;
    } else if (title.toLowerCase().contains('kids')) {
      return Icons.child_care;
    } else {
      return Icons.menu_book_outlined;
    }
  }
}
