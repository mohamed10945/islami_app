import 'package:flutter/material.dart';
import 'package:islami_app/app_thame.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';

class SuraContentScreen extends StatelessWidget {
  static const String routeName = "/sura_content";
  late SuraContentScreenArgs args;

  List<String> ayat = [
    "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ ",
    "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
    " الرَّحْمَنِ الرَّحِيمِ",
    " مَالِكِ يَوْمِ الدِّينِ",
    " إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
    " اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ",
    " صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين"
  ];

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as SuraContentScreenArgs;
    loadSuraFile();
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/default_bg.png"),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          appBar: AppBar(
            title: Text("الفاتحه"),
          ),
          body: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.07,
                horizontal: 24),
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ListView.builder(
              itemBuilder: (context, index) => Text(
                ayat[index],
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              itemCount: ayat.length,
            ),
          ),
        ));
  }

  void loadSuraFile() {
    print(args.suraName);
  }
}
