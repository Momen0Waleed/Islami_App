import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_theme_manager.dart';
import 'package:islami_app/core/services/local_storage_services.dart';
import 'package:islami_app/modules/hadith/widgets/hadith_data_view.dart';
import 'package:islami_app/modules/home/home_screen.dart';
import 'package:islami_app/modules/onboarding/on_boarding.dart';
import 'package:islami_app/modules/splash/splash_screen.dart';

import 'modules/quran/widgets/quran_data_view.dart';
import 'modules/sala_time/widgets/zikr_view_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageServices.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: IslamiThemeManager.islamiThemeData,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        QuranDataView.routeName: (context) => QuranDataView(),
        HadithDataView.routeName: (context) => HadithDataView(),
        ZikrViewScreen.routeName: (context) => ZikrViewScreen(),
      },
    );
  }
}
