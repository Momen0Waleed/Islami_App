import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_images.dart';
import 'package:islami_app/models/sura_data_model.dart';

class SuraListItem extends StatelessWidget {
  final SuraDataModel suraDataModel;
  final VoidCallback onSuraTab;

  const SuraListItem(
      {super.key, required this.suraDataModel, required this.onSuraTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSuraTab,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(IslamiImages.suraNumber)),
            ),
            child: Text(
              suraDataModel.suraID,
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(
                fontSize: (int.parse(suraDataModel.suraID) >= 100)
                    ? 12 : 16,
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  suraDataModel.suraNameEN,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
                ),Text(
                  "${suraDataModel.suraVersesNumber} Verses",
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium,
                ),
              ],
            ),
          ),
          Text(
            suraDataModel.suraNameAR,
            style: Theme.of(context).textTheme.bodyLarge,
          )

        ],
      ),
    );
  }
}
