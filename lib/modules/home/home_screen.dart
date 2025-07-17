import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/core/constants/islami_images.dart';
import 'package:islami_app/modules/hadith/hadith_view.dart';
import 'package:islami_app/modules/quran/quran_view.dart';
import 'package:islami_app/modules/radio/radio_view.dart';
import 'package:islami_app/modules/sala_time/sala_time_view.dart';
import 'package:islami_app/modules/tasbeh/tasbeh_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranView(),
    HadithView(),
    TasbehView(),
    RadioView(),
    SalaTimeView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(IslamiImages.mushafPageIcon)),
            label: "Quran",
            activeIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
              decoration: BoxDecoration(
                color: IslamiColors.gray,
                borderRadius: BorderRadius.circular(16)
              ),
              child:  ImageIcon(AssetImage(IslamiImages.mushafPageIcon)),
            )
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(IslamiImages.hadithPageIcon)),
            label: "Hadith",
              activeIcon: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(
                    color: IslamiColors.gray,
                    borderRadius: BorderRadius.circular(16)
                ),
                child:  ImageIcon(AssetImage(IslamiImages.hadithPageIcon)),
              )
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(IslamiImages.sebhaPageIcon)),
            label: "Tasbeeh",
              activeIcon: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(
                    color: IslamiColors.gray,
                    borderRadius: BorderRadius.circular(16)
                ),
                child:  ImageIcon(AssetImage(IslamiImages.sebhaPageIcon)),
              )
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(IslamiImages.radioPageIcon)),
            label: "Radio",
              activeIcon: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(
                    color: IslamiColors.gray,
                    borderRadius: BorderRadius.circular(16)
                ),
                child:  ImageIcon(AssetImage(IslamiImages.radioPageIcon)),
              )
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(IslamiImages.salaTimePageIcon)),
            label: "Salah Time",
              activeIcon: Container(
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                decoration: BoxDecoration(
                    color: IslamiColors.gray,
                    borderRadius: BorderRadius.circular(16)
                ),
                child:  ImageIcon(AssetImage(IslamiImages.salaTimePageIcon)),
              )
          ),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
