import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/core/constants/islami_images.dart';
import 'package:islami_app/modules/quran/widgets/recently_sura_widget.dart';
import 'package:islami_app/modules/quran/widgets/sura_list_widget.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(IslamiImages.backgroundQuranListPage),
            fit: BoxFit.cover
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // spacing: 10,
          children: [
            Image.asset(
              IslamiImages.quranPageLogo,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: TextField(
                cursorColor: IslamiColors.gold,
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: IslamiColors.gold,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: IslamiColors.gold,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: IslamiColors.gold,
                      width: 1,
                    ),
                  ),
        
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: ImageIcon(AssetImage(IslamiImages.mushafPageIcon),color: IslamiColors.gold,),
                  )
        
        
                ),
        
              ),
            ),
            RecentlySuraWidget(),
            SuraListWidget()
        
          ],
        ),
      ),
    );
  }

  onSuraTab(int index) {

  }
}
