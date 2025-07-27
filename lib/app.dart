import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hodtech/config/theme.dart';
import 'package:hodtech/core/di-manual/di_manual.dart';
import 'package:hodtech/core/routes/route.dart';
import 'package:hodtech/features/authentication/view/splash.dart';
import 'package:hodtech/features/dashboard/notifier/dashboard_notifier.dart';
import 'package:hodtech/features/home/notifier/home_notifier.dart';
import 'package:hodtech/features/devotional/notifier/devotional_notifier.dart';
import 'package:provider/provider.dart';

class HodApp extends StatefulWidget {
  const HodApp({super.key});

  @override
  State<HodApp> createState() => _HodAppState();
}

class _HodAppState extends State<HodApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<DashBoardNotifier>()),
        ChangeNotifierProvider.value(value: getIt<HomeNotifier>()),
        ChangeNotifierProvider.value(value: getIt<DevotionalNotifier>()),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'HodTech',
          initialRoute: SplashScreen.routeName,
          theme: theme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
