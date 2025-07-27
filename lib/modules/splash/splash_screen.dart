import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/core/constants/islami_images.dart';
import 'package:islami_app/modules/onboarding/on_boarding.dart';

import '../../core/services/local_storage_keys.dart';
import '../../core/services/local_storage_services.dart';
import '../home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName= "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    final hasSeenOnboarding = LocalStorageServices.getBool(
        LocalStorageKeys.onboardingSeenKey) ?? false;
    await Future.delayed(Duration(seconds: 2)); // splash delay

    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      hasSeenOnboarding ? HomeScreen.routeName : OnboardingScreen.routeName,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IslamiColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(IslamiImages.splashIcon,fit: BoxFit.cover,),
          Image.asset(IslamiImages.splashTitle,height:75),
          SizedBox(height: 100,)
        ],
      ),

    );
  }
}
