import 'package:flutter/material.dart';

import '../../core/constants/islami_images.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(IslamiImages.backgroundRadioPage),
            fit: BoxFit.cover
        ),
      ),
    );
  }
}
