import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/core/constants/islami_images.dart';
import 'package:islami_app/models/sura_data_model.dart';

class QuranDataView extends StatefulWidget {
  static const String routeName = "QuranDataView";

  QuranDataView({super.key});

  @override
  State<QuranDataView> createState() => _QuranDataViewState();
}

class _QuranDataViewState extends State<QuranDataView> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as SuraDataModel;

    if (ayat.isEmpty) loadDataFromAssets(data.suraID);
    return Scaffold(
      appBar: AppBar(
        title: Text(data.suraNameEN),
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
                      data.suraNameAR,
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
            child: ayat.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: IslamiColors.gold),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        if (basmalah.isNotEmpty)
                          Text(
                            basmalah,
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  color: IslamiColors.gold,
                                  fontSize: 24,
                                ),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                          ),
                        const SizedBox(height: 24),
                        Text(
                          ayat
                              .asMap()
                              .entries
                              .map((entry) {
                                final index = entry.key;
                                final text = entry.value;
                                return "$text [${index + 1}]";
                              })
                              .join(" "),
                          textAlign: TextAlign.center,
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium!.copyWith(height: 2),
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

  List<String> ayat = [];
  String basmalah = "";

  Future<void> loadDataFromAssets(String suraID) async {
    String content = await rootBundle.loadString("assets/files/$suraID.txt");
    ayat = content.trim().split("\n");
    if (suraID != "9" && suraID != "1") {
      basmalah = "بِسْمِ ٱللّٰهِ ٱلرَّحْمَـٰنِ ٱلرَّحِيمِ";
    }
    setState(() {});
  }
}
