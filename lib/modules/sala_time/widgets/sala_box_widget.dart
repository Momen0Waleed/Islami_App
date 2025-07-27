import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';
import 'package:islami_app/core/constants/islami_images.dart';
import 'package:islami_app/modules/sala_time/widgets/sala_body_widget.dart';
import 'package:islami_app/modules/sala_time/widgets/sala_footer_widget.dart';
import 'package:islami_app/modules/sala_time/widgets/sala_header_widget.dart';

class SalaBoxWidget extends StatefulWidget {
  const SalaBoxWidget({super.key});

  @override
  State<SalaBoxWidget> createState() => _SalaBoxWidgetState();
}

class _SalaBoxWidgetState extends State<SalaBoxWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: IslamiColors.darkGold,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Image.asset(IslamiImages.selectedDataBackground),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    "Pray Time",
                    style: theme.textTheme.titleLarge!.copyWith(
                      color: Color(0xFF584E3C),
                      fontSize: 18,
                      letterSpacing: 0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Tuesday",
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: IslamiColors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              SalaHeaderWidget(),
              Expanded(child: SalaBodyWidget()),
              SalaFooterWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
