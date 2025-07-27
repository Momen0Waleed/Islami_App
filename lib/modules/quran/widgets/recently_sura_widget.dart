import 'package:flutter/material.dart';
import 'package:islami_app/models/sura_data_model.dart';
import 'package:islami_app/modules/quran/widgets/recent_sura.dart';

import '../../../core/constants/sura_constraint_list.dart';

class RecentlySuraWidget extends StatelessWidget {
  const RecentlySuraWidget(
      {super.key, required this.suraDataList, required this.onSuraTap});

  final List<SuraDataModel> suraDataList;
  final void Function(int realIndex) onSuraTap;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // spacing: 10,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Text("Most Recently ",style: Theme.of(context).textTheme.bodyLarge,),
        ),
        SizedBox(
          height: 155,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                final sura = suraDataList[index];
                return InkWell(
                  onTap: () {
                    int realIndex = SuraConstraintList.suraData.indexWhere(
                          (suraItem) => suraItem.suraID == sura.suraID,
                    );
                    if (realIndex != -1) {
                      onSuraTap(realIndex);
                    }
                  },
                  child: RecentSura(suraDataModel: sura),
                );
                },
              separatorBuilder: (context,index){
                return SizedBox(width: 10,);
              },
              itemCount: suraDataList.length),
        )


      ],

    );
  }
}
