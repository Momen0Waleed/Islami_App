import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/models/hadith_data_model.dart';

import '../../../core/constants/islami_colors.dart';
import '../../../core/constants/islami_images.dart';

class HadithDataView extends StatefulWidget {
  static const String routeName = "HadithDataView";

  const HadithDataView({super.key});

  @override
  State<HadithDataView> createState() => _HadithDataViewState();
}

class _HadithDataViewState extends State<HadithDataView> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as HadithDataModel;

    if (hadithExtendedContent == "") loadHadithDataFromAssets(data.hadithID);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hadith ${data.hadithID}"),
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
                      data.hadithName,
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
            child: hadithExtendedContent == ""
                ? Center(
                    child: CircularProgressIndicator(color: IslamiColors.gold),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          hadithExtendedContent,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(height: 2, color: IslamiColors.gold),
                          textDirection: TextDirection.rtl,
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

  String hadithExtendedContent = "";

  Future<void> loadHadithDataFromAssets(String hadithID) async {
    String content = await rootBundle.loadString(
      "assets/files/HadithData/$hadithID.txt",
    );
    hadithExtendedContent = content;
    setState(() {});
  }
}
