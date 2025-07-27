
import 'package:flutter/material.dart';
import 'package:hodtech/core/assets/assets.dart';
import 'package:hodtech/core/utils/colors.dart';
import 'package:hodtech/features/authentication/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initApp();
    });
  }

  Future<void> _initApp() async {
    await getConfig();
    Future.delayed(const Duration(seconds: 4), () async {
    await _getClientCredentials();
    });
  }

  Future<void> getConfig() async {
    // Example: await context.read<AppConfigProvider>().loadRemoteConfig();
  }

  Future _getClientCredentials() async {
   // var hasLoggedIn = false;
 
    //if (!hasLoggedIn) {
      Navigator.pushReplacementNamed(context, EmailEntryScreen.routeName);
    // } else {
    //   Navigator.pushReplacementNamed(context, EmailEntryScreen.routeName);
    // }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 106,
                  width: 164,
                  // child: SvgPicture.asset(
                  //   kHodLogoSvg,
                  //   fit: BoxFit.contain,
                  // ),
                  child: Image.asset(
                    kHodLogo,
                    fit: BoxFit.contain,
                  ) ,
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "Built for Worship",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: appColor.grey_800,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

