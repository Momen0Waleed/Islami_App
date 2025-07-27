import 'package:flutter/material.dart';
import 'package:islami_app/modules/sala_time/widgets/azkar_list_widget.dart';
import 'package:islami_app/modules/sala_time/widgets/sala_box_widget.dart';

import '../../core/constants/islami_images.dart';

class SalaTimeView extends StatelessWidget {
  const SalaTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(top: 30, left: 25, right: 25),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(IslamiImages.backgroundSalaTimePage),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(IslamiImages.quranPageLogo),
              SalaBoxWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Azkar",
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                        fontSize: 20
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              AzkarListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
