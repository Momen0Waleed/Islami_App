import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_images.dart';

class SuraListItem extends StatelessWidget {
  const SuraListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // color: Colors.red,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(IslamiImages.suraNumber)),
            ),
            child: Text(
              "1",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Al-Fatiha",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
                ),Text(
                  "7 Verses",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Text(
            "الفاتحة",
            style: Theme.of(context).textTheme.bodyLarge,
          )

        ],
      ),
    );
  }
}
