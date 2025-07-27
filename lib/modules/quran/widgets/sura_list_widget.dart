import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/sura_constraint_list.dart';
import 'package:islami_app/modules/quran/widgets/sura_list_item.dart';

class SuraListWidget extends StatelessWidget {
  const SuraListWidget({super.key, required this.onSuraTab});

  final void Function(int) onSuraTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("Sura List", style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge)),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SuraListItem(
                  onSuraTab: () => onSuraTab(index),
                  suraDataModel: SuraConstraintList.suraData[index],
              );
              },
              separatorBuilder: (context,index){
                return Divider(
                indent: 40,
                endIndent: 40,
                thickness: 2,
              );
              },
              itemCount: SuraConstraintList.suraData.length)
        ],
      ),
    );
  }
}
