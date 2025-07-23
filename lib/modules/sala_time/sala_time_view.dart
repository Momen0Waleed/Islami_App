import 'package:flutter/material.dart';
import 'package:islami_app/modules/sala_time/widgets/sala_box_widget.dart';

import '../../core/constants/islami_images.dart';

class SalaTimeView extends StatelessWidget {
  const SalaTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(IslamiImages.backgroundSalaTimePage),
            fit: BoxFit.cover
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            IslamiImages.quranPageLogo,
          ),
          SalaBoxWidget(),


        ],
      ),
    );
  }
}
