import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/hadith_data_constraints.dart';
import 'package:islami_app/core/constants/islami_images.dart';
import 'package:islami_app/modules/hadith/widgets/hadith_data_view.dart';

import '../../../core/constants/islami_colors.dart';

class HadithCardWidget extends StatefulWidget {
  final int hadithID;

  const HadithCardWidget({super.key, required this.hadithID});

  @override
  State<HadithCardWidget> createState() => _HadithCardWidgetState();
}

class _HadithCardWidgetState extends State<HadithCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadithDataView.routeName,
          arguments: HadithDataConstraints.hadithData[widget.hadithID],
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: IslamiColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            left: 8,
            right: 8,
            bottom: 0,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        IslamiImages.cornerLeft,
                        color: IslamiColors.black,
                        height: 90,
                        width: 90,
                      ),
                      Expanded(
                        child: Text(
                          HadithDataConstraints
                              .hadithData[widget.hadithID]
                              .hadithName,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(color: IslamiColors.black),
                        ),
                      ),
                      Image.asset(
                        IslamiImages.cornerRight,
                        color: IslamiColors.black,
                        height: 90,
                        width: 90,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      IslamiImages.hadithCardImage,
                      color: IslamiColors.gray.withAlpha(100),
                    ),
                  ),
                  Image.asset(
                    IslamiImages.bottomShape,
                    color: IslamiColors.black,
                    width: double.infinity,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 90.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        HadithDataConstraints
                            .hadithData[widget.hadithID]
                            .hadithContent,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(height: 2, color: IslamiColors.black),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
