import 'package:flutter/material.dart';

import '../../core/constants/islami_images.dart';

class HadithView extends StatelessWidget {
  const HadithView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(IslamiImages.backgroundHadithPage),
            fit: BoxFit.cover
        ),
      ),
    );
  }
}
