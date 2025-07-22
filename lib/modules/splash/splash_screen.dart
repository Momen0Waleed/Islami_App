import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/core/constants/islami_images.dart';
import 'package:islami_app/modules/onboarding/on_boarding.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName= "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context,OnboardingScreen.routeName);
    });
    super.initState();
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
