import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/core/constants/islami_images.dart';
import 'package:islami_app/core/constants/sura_constraint_list.dart';
import 'package:islami_app/core/services/local_storage_keys.dart';
import 'package:islami_app/core/services/local_storage_services.dart';
import 'package:islami_app/models/sura_data_model.dart';
import 'package:islami_app/modules/quran/widgets/quran_data_view.dart';
import 'package:islami_app/modules/quran/widgets/recently_sura_widget.dart';
import 'package:islami_app/modules/quran/widgets/sura_list_widget.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  void initState() {
    super.initState();
    loadRecentSuraData();
  }

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IslamiImages.backgroundQuranListPage),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // spacing: 10,
          children: [
            Image.asset(IslamiImages.quranPageLogo),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: TextFormField(
                onChanged: (value) {
                  searchQuery = value;
                  searchSura();
                  setState(() {});
                },
                cursorColor: IslamiColors.gold,
                decoration: InputDecoration(
                  hintText: "Sura Name",
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: IslamiColors.gold, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: IslamiColors.gold, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: IslamiColors.gold, width: 1),
                  ),

                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: ImageIcon(
                      AssetImage(IslamiImages.mushafPageIcon),
                      color: IslamiColors.gold,
                    ),
                  ),
                ),
              ),
            ),

            Visibility(
              visible: searchQuery.isEmpty,
              replacement: SuraListWidget(
                onSuraTab: onSuraTab,
                suraDataModel: searchSuraList,
              ),
              child: Column(
                children: [
                  recentSuraList.isNotEmpty
                      ? RecentlySuraWidget(
                          suraDataList: recentSuraList,
                          onSuraTap: onSuraTab,
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "No recent Sura yet",
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(color: IslamiColors.gold),
                            ),
                          ),
                        ),
                  SuraListWidget(
                    onSuraTab: onSuraTab,
                    suraDataModel: SuraConstraintList.suraData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> recentSuraIndexList = [];

  List<SuraDataModel> recentSuraList = [];

  onSuraTab(int index) {
    _cacheSuraIndex(index);
    Navigator.pushNamed(
      context,
      QuranDataView.routeName,
      arguments: SuraConstraintList.suraData[index],
    );
  }

  _cacheSuraIndex(int index) {
    var indexString = index.toString();
    if (recentSuraIndexList.contains(indexString)) {
      recentSuraIndexList.remove(indexString);
    }
    if (recentSuraIndexList.length == 5) {
      recentSuraIndexList.removeLast();
    }
    recentSuraIndexList.insert(0, indexString);
    LocalStorageServices.setStringList(
      LocalStorageKeys.recentSurasKey,
      recentSuraIndexList,
    );
    loadRecentSuraData();
    setState(() {});
  }

  loadRecentSuraData() {
    recentSuraIndexList = [];
    recentSuraList = [];
    recentSuraIndexList =
        LocalStorageServices.getStringList(LocalStorageKeys.recentSurasKey) ??
        [];
    for (var index in recentSuraIndexList) {
      int indexInt = int.parse(index);
      recentSuraList.add(SuraConstraintList.suraData[indexInt]);
    }
  }

  List<SuraDataModel> searchSuraList = [];

  void searchSura() {
    searchSuraList = [];
    for (var sura in SuraConstraintList.suraData) {
      if (sura.suraNameEN.toLowerCase().contains(searchQuery.toLowerCase()) ||
          sura.suraNameAR.contains(searchQuery)) {
        searchSuraList.add(sura);
      }
    }
  }
}
