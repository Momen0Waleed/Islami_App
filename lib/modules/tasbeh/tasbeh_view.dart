import 'package:flutter/material.dart';

import '../../core/constants/islami_images.dart';

class TasbehView extends StatelessWidget {
  const TasbehView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(IslamiImages.backgroundTasbehPage),
            fit: BoxFit.cover
        ),
      ),
    );
  }
}
