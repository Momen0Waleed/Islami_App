import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/core/constants/islami_images.dart';

class RecentSura extends StatelessWidget {
  const RecentSura({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 285,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: IslamiColors.gold,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( 
                "Al-Anbiya",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 15,),
              Text(
                "الأنبياء",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Spacer(),
              Text(
                "112 Verses",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          Expanded(child: Image.asset(IslamiImages.quranSura))
        ],
      ),
    );
  }
}
