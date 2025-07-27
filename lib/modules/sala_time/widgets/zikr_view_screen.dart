import 'package:flutter/material.dart';

import '../../../core/constants/islami_colors.dart';
import '../../../core/constants/islami_images.dart';
import '../../../models/zikr_data_model.dart';

class ZikrViewScreen extends StatefulWidget {
  const ZikrViewScreen({super.key});

  static String routeName = "ZikrViewScreen";

  @override
  State<ZikrViewScreen> createState() => _ZikrViewScreenState();
}

class _ZikrViewScreenState extends State<ZikrViewScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as ZikrDataModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(data.zikrName),
        forceMaterialTransparency: true,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(IslamiImages.cornerLeft, height: 90, width: 90),
                  Expanded(
                    child: Text(
                      "الأذكار",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: IslamiColors.gold,
                      ),
                    ),
                  ),
                  Image.asset(IslamiImages.cornerRight, height: 90, width: 90),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 90.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(
                        "${data.zikrContent[index]} \n",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(height: 2, color: IslamiColors.gold),
                        textDirection: TextDirection.rtl,
                      );
                    },
                    itemCount: data.zikrContent.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Image.asset(
        IslamiImages.bottomShape,
        color: IslamiColors.gold,
        width: double.infinity,
      ),
    );
  }
}
