import 'package:flutter/material.dart';
import 'package:islami_app/app_thame.dart';
import 'package:islami_app/tabs/hadeth/hadrth.dart';
import 'package:islami_app/tabs/settings/settings_Provider.dart';
import 'package:islami_app/widgets/loading_indecator.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatelessWidget {
  static const String routeName = '/hadeth_content';

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
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
            title: Text(hadeth.title),
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
            child: ListView.builder(
              itemBuilder: (context, index) => Text(
                hadeth.content[index],
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              itemCount: hadeth.content.length,
            ),
          ),
        ));
  }
}
