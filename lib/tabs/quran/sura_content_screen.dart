import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_thame.dart';
import 'package:islami_app/tabs/quran/quran_tab.dart';
import 'package:islami_app/tabs/settings/settings_Provider.dart';
import 'package:islami_app/widgets/loading_indecator.dart';
import 'package:provider/provider.dart';

class SuraContentScreen extends StatefulWidget {
  static const String routeName = "/sura_content";
  const SuraContentScreen({super.key});

  @override
  State<SuraContentScreen> createState() => _SuraContentScreen();
}

class _SuraContentScreen extends State<SuraContentScreen> {
  late SuraContentScreenArgs args;

  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as SuraContentScreenArgs;
    if (ayat.isEmpty) loadSuraFile();

    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
              "assets/images/${settingsProvider.backgroundImageName}.png"),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.suraName),
          ),
          body: Container(
            padding: EdgeInsets.all(24),
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.07,
                horizontal: 24),
            decoration: BoxDecoration(
              color: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ayat.isEmpty
                ? LoaingIndecator()
                : ListView.builder(
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

  Future<void> loadSuraFile() async {
    String sura =
        await rootBundle.loadString("assets/data/${args.suraNumber}.txt");
    ayat = sura.split('\n');

    setState(() {});
  }
}
