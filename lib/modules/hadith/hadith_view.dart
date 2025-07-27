import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/modules/hadith/widgets/hadith_card_widget.dart';

import '../../core/constants/islami_images.dart';

class HadithView extends StatelessWidget {
  const HadithView ({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(IslamiImages.backgroundHadithPage),
            fit: BoxFit.cover
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            IslamiImages.quranPageLogo,
          ),
          CarouselSlider(
              items: [
                HadithCardWidget(hadithID: index++,),
                HadithCardWidget(hadithID: index++,),
                HadithCardWidget(hadithID: index++,),
                HadithCardWidget(hadithID: index++,),
                HadithCardWidget(hadithID: index++,),
              ],
              options: CarouselOptions(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.65,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )
          ),
        ],
      ),
    );
  }
}
