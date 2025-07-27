import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/islami_colors.dart';

import '../../core/constants/islami_images.dart';

class TasbehView extends StatefulWidget {
  const TasbehView({super.key});

  @override
  State<TasbehView> createState() => _TasbehViewState();
}

class _TasbehViewState extends State<TasbehView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int counter = 33;
  int rotationCount = 0;

  List<String> azkar = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int currentZikrIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  bool finishedAzkar = false;

  void rotateSebha() {
    if (_controller.isAnimating || finishedAzkar) return;

    setState(() {
      counter--;
      if (counter == 0) {
        rotationCount++;
        if (rotationCount >= azkar.length) {
          // Finished all azkar
          finishedAzkar = true;
        } else {
          counter = 33;
          currentZikrIndex = rotationCount % azkar.length;
        }
      }
    });

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 25, right: 25),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(IslamiImages.backgroundTasbehPage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(IslamiImages.quranPageLogo),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              "سبّح اسمَ رَبِّكَ الأَعلَى",
              style: TextStyle(fontSize: 36, color: IslamiColors.white),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  finishedAzkar
                      ? Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'لا إله إلا الله وحده لا شريك له، له الملك وله الحمد وهو على كل شيء قدير',
                                style: TextStyle(
                                  fontSize: 28,
                                  color: IslamiColors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : Text(
                          azkar[currentZikrIndex],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        ),
                  SizedBox(height: 20),
                  !finishedAzkar
                      ? Text(
                          "$counter",
                          style: const TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      : Text(""),
                ],
              ),
              GestureDetector(
                onTap: rotateSebha,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _controller.value * 0.1,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    IslamiImages.sebha,
                    height: MediaQuery.of(context).size.height * 0.5,
                    // width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
          if (finishedAzkar)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: IslamiColors.gold,
              ),

              onPressed: () {
                setState(() {
                  finishedAzkar = false;
                  counter = 33;
                  rotationCount = 0;
                  currentZikrIndex = 0;
                });
              },
              child: Text(
                'Restart Tasbeh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: IslamiColors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
