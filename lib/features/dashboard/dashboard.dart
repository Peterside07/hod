import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hodtech/core/utils/colors.dart';
import 'package:hodtech/features/dashboard/notifier/dashboard_notifier.dart';
import 'package:hodtech/features/devotional/views/devotional_view_new.dart';
import 'package:hodtech/features/home/home_view.dart';
import 'package:provider/provider.dart';

class BottomNavModel {
  final String? label;
  final String? tooltip;
  final Widget? views;
  final String? icon;
  final String? iconActive;

  const BottomNavModel({
    this.label,
    this.tooltip,
    this.views,
    this.icon,
    this.iconActive,
  });

  factory BottomNavModel.fromJson(Map<String, dynamic> map) => BottomNavModel(
        icon: map['icon'],
        label: map['label'],
        tooltip: map['tooltip'],
        views: map['view'],
        iconActive: map['iconActive'],
      );
}

List<BottomNavModel> sections(BuildContext context) {
  return [
    const BottomNavModel(
      label: 'Home',
      icon: 'assets/svgs/home.svg',
      tooltip: 'Home',
      views: HomePageView(),
    ),
    const BottomNavModel(
      label: 'Devotional',
      icon: 'assets/svgs/devotional.svg',
      tooltip: 'Devotional',
      views: DevotionalPage(),
    ),
    const BottomNavModel(
      label: 'Stream',
      icon: 'assets/svgs/stream.svg',
      tooltip: 'Stream',
      views: StreamPage(),
    ),
    const BottomNavModel(
      label: 'Groups',
      icon: 'assets/svgs/groups.svg',
      tooltip: 'Groups',
      views: GroupsPage(),
    ),
    const BottomNavModel(
      label: 'More',
      icon: 'assets/svgs/more.svg',
      tooltip: 'More',
      views: MorePage(),
    ),
  ];
}

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardNotifier>(
      builder: (context, nav, _) {
        return Scaffold(
          body: const _PageBody(),
          bottomNavigationBar: Container(
            color: Colors.white,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.white,
              currentIndex: nav.section,
              onTap: (index) => nav.updateSection(index),
              selectedItemColor: appColor.primary_500,
              unselectedItemColor: appColor.grey_600,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              iconSize: 24,
              selectedLabelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: appColor.primary_500,
              ),
              items: sections(context).map((e) {
                //final index = sections(context).indexOf(e);
               // final isActive = index == nav.section;
                return BottomNavigationBarItem(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        e.icon!,
                        height: 24,
                      ),
                    ],
                  ),
                  label: e.label,
                  tooltip: e.tooltip,
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _PageBody extends StatelessWidget {
  const _PageBody();

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardNotifier>(builder: (_, value, __) {
      return IndexedStack(
        index: value.section,
        children: sections(context)
            .map(
              (e) => GestureDetector(
                  onTap: () {}, child: e.views ?? const SizedBox()),
            )
            .toList(),
      );
    });
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});
  @override
  Widget build(BuildContext context) => const HomeView();
}

class DevotionalPage extends StatelessWidget {
  const DevotionalPage({super.key});
  @override
  Widget build(BuildContext context) => const DevotionalView();
}

class StreamPage extends StatelessWidget {
  const StreamPage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Stream'));
}

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('Groups'));
}

class MorePage extends StatelessWidget {
  const MorePage({super.key});
  @override
  Widget build(BuildContext context) => const Center(child: Text('More'));
}
