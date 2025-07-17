import 'package:flutter/material.dart';
import 'package:islami_app/modules/quran/widgets/recent_sura.dart';

class RecentlySuraWidget extends StatelessWidget {
  const RecentlySuraWidget({super.key});

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
                return RecentSura();
                },
              separatorBuilder: (context,index){
                return SizedBox(width: 10,);
              },
              itemCount: 10),
        )


      ],

    );
  }
}
