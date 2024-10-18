import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:islami_app/tabs/settings/settings_Provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _rotationAngle = 0;
  List<String> zeker = ["سبحان الله ", "الحمد لله", "الله اكبر"];
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/${settingsProvider.SebhaHead}.png',
                ),
                GestureDetector(
                  onTap: _rotateImage,
                  child: Transform.rotate(
                    angle: _rotationAngle,
                    child: Image.asset(
                        'assets/images/${settingsProvider.SebhaBody}.png'),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "عدد التسبيحات",
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          Container(
            height: 69,
            width: 81,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              counter.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 51,
            width: 173,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: settingsProvider.isDark
                    ? Color(0xFFFACC1D)
                    : Theme.of(context).primaryColor),
            child: Text(
              CurrentZeker(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  void _rotateImage() {
    setState(() {
      _rotationAngle += 15 * (math.pi / 180);
      CurrentZeker();
      counter++; // Convert degrees to radians
    });
  }

  String CurrentZeker() {
    return zeker[(counter ~/ 33) % zeker.length];
  }
}
