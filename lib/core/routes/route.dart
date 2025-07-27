
import 'package:flutter/material.dart';
import 'package:hodtech/features/authentication/view/complete_profile.dart';
import 'package:hodtech/features/authentication/view/login_screen.dart';
import 'package:hodtech/features/authentication/view/splash.dart';
import 'package:hodtech/features/dashboard/dashboard.dart';
import 'package:hodtech/features/devotional/views/devotional_detail_view.dart';
import 'package:hodtech/features/devotional/views/devotional_timeline_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  return switch (settings.name) {
       EmailEntryScreen.routeName => MaterialPageRoute(
        builder: (_) =>  EmailEntryScreen(),
        settings: const RouteSettings(name: EmailEntryScreen.routeName),
      ),
      SplashScreen.routeName => MaterialPageRoute(
        builder: (_) => const SplashScreen(),
        settings: const RouteSettings(name: SplashScreen.routeName),
      ),
      CompleteProfile.routeName => MaterialPageRoute(
        builder: (_) => const CompleteProfile(),
        settings: const RouteSettings(name: CompleteProfile.routeName),
      ),
      DashboardScreen.routeName => MaterialPageRoute(
        builder: (_) => const DashboardScreen(),
        settings: const RouteSettings(name: DashboardScreen.routeName),
      ),
      DevotionalTimelineView.routeName => MaterialPageRoute(
        builder: (_) => DevotionalTimelineView(
          category: settings.arguments,
        ),
        settings: const RouteSettings(name: DevotionalTimelineView.routeName),
      ),
      DevotionalDetailView.routeName => MaterialPageRoute(
        builder: (_) => DevotionalDetailView(
          devotionalId: settings.arguments as String,
        ),
        settings:  const RouteSettings(name: DevotionalDetailView.routeName),
      ),

 
      _ => MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
        settings: const RouteSettings(name: 'Not Found'),
      ),

  };
  
}