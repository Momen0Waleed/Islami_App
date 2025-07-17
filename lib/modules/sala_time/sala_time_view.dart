import 'package:flutter/material.dart';

import '../../core/constants/islami_images.dart';

class SalaTimeView extends StatelessWidget {
  const SalaTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(IslamiImages.backgroundSalaTimePage),
            fit: BoxFit.cover
        ),
      ),
    );
  }
}
