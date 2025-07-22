import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/modules/radio/widgets/radio_list_view.dart';

import '../../core/constants/islami_images.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  bool radio = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IslamiImages.backgroundRadioPage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(IslamiImages.quranPageLogo),
          Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: IslamiColors.gray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!radio) {
                          radio = !radio;
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease,
                      height: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: radio ? IslamiColors.gold : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Radio",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: radio ? IslamiColors.black : IslamiColors
                              .white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (radio) {
                          radio = !radio;
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.ease,
                      height: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: radio ? Colors.transparent : IslamiColors.gold,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Reciters",
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: radio ? IslamiColors.white : IslamiColors
                              .black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
              child: RadioListView(isRadio: radio,)
          ),
        ],
      ),
    );
  }
}
