import 'package:flutter/material.dart';
import '../models/user_profile_model.dart';

class GreetingHeader extends StatelessWidget {
  final UserProfileModel user;
  final VoidCallback? onSearchTap;
  final VoidCallback? onFlameTap;

  const GreetingHeader({
    super.key,
    required this.user,
    this.onSearchTap,
    this.onFlameTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
            radius: 20,
            onBackgroundImageError: (_, __) {},
            child: user.avatarUrl.isEmpty 
                ? Text(
                    user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                : null,
          ),
          const SizedBox(width: 10),

          // Greeting
          Expanded(
            child: Text(
              "Hi, ${user.name}!",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
          ),

          // Search Icon
          IconButton(
            onPressed: onSearchTap,
            icon: const Icon(Icons.search),
            color: Colors.grey.shade700,
          ),

          // Flame Icon + Count
          GestureDetector(
            onTap: onFlameTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
             
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.orange.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${user.flameCount}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.orange.shade800,
                        ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
