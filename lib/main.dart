import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_theme_manager.dart';
import 'package:islami_app/modules/home/home_screen.dart';
import 'package:islami_app/modules/onboarding/on_boarding.dart';
import 'package:islami_app/modules/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;

  runApp(MyApp(showOnboarding: !onboardingCompleted));
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;

  const MyApp({super.key, required this.showOnboarding});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: IslamiThemeManager.islamiThemeData,
      initialRoute: showOnboarding
          ? OnboardingScreen.routeName
          : HomeScreen.routeName,
      routes: {
        SplashScreen.routeName : (context) => const SplashScreen(),
        HomeScreen.routeName : (context) => const HomeScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
      },

    );
  }
}

