import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/sura_constraint_list.dart';
import 'package:islami_app/modules/quran/widgets/sura_list_item.dart';

class SuraListWidget extends StatelessWidget {
  const SuraListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Column(
        children: [
          Text("Suar List",style: Theme.of(context).textTheme.bodyLarge,),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){eturn SuraListItem(
                suraDataModel: SuraConstraintList.suraData[index],
              );
            }},
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
