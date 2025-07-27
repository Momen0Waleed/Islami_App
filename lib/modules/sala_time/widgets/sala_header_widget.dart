import 'package:flutter/material.dart';

import '../../../core/constants/islami_colors.dart';

class SalaHeaderWidget extends StatefulWidget {
  const SalaHeaderWidget({super.key, required this.boxHeight});

  final double boxHeight;

  @override
  State<SalaHeaderWidget> createState() => _SalaHeaderWidgetState();
}

class _SalaHeaderWidgetState extends State<SalaHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: widget.boxHeight * 0.25,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("16 Jul,\n2024", style: theme.textTheme.bodyLarge),
                // Spacer(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                Text(
                  "09 Muh,\n1446",
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          // Row(
          //   children: [
          //     Expanded(flex: 2, child: Container(color: Colors.transparent)),
          //     Expanded(
          //       flex: 10,
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.end,
          //         children: [
          //           Image.asset(IslamiImages.leftCornerSalaHeader, width: 45),
          //           Expanded(
          //             child: Container(
          //               padding: EdgeInsets.symmetric(
          //                 horizontal: 35,
          //                 vertical: 8,
          //               ),
          //               height: double.infinity,
          //               decoration: BoxDecoration(
          //                 color: IslamiColors.gold,
          //                 borderRadius: BorderRadius.only(
          //                   topRight: Radius.circular(30),
          //                   topLeft: Radius.circular(30),
          //                 ),
          //               ),
          //               child: Column(
          //                 children: [
          //                   Text(
          //                     "Pray Time",
          //                     style: theme.textTheme.titleLarge!.copyWith(
          //                       color: Color(0xFF584E3C),
          //                       fontSize: 18,
          //                       letterSpacing: 0,
          //                     ),
          //                   ),
          //                   Text(
          //                     "Tuesday",
          //                     style: theme.textTheme.titleMedium!.copyWith(
          //                       color: IslamiColors.black,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           Image.asset(IslamiImages.rightCornerSalaHeader, width: 45),
          //         ],
          //       ),
          //     ),
          //     Expanded(flex: 2, child: Container(color: Colors.transparent)),
          //   ],
          // ),
        ],
      ),
    );
  }
}
