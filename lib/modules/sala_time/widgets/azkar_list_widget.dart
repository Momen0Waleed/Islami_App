import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/azkar_data_constraints.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/modules/sala_time/widgets/zikr_view_screen.dart';

import '../../../models/zikr_data_model.dart';

class AzkarListWidget extends StatelessWidget {
  AzkarListWidget({super.key});

  final List<ZikrDataModel> azkarData = AzkarDataConstraints.azkarData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ZikrViewScreen.routeName,
                  arguments: AzkarDataConstraints.azkarData[index],
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: IslamiColors.black,
                  border: BoxBorder.all(color: IslamiColors.gold, width: 2),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        azkarData[index].zikrImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        azkarData[index].zikrName,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: IslamiColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: 8,
        ),
      ],
    );
  }
}
