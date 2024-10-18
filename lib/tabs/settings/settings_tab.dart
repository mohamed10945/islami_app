import 'package:flutter/material.dart';
import 'package:islami_app/app_thame.dart';
import 'package:islami_app/tabs/settings/language.dart';
import 'package:islami_app/tabs/settings/settings_Provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'العربية', code: 'ar'),
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark Theme",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
                onChanged: (isDark) => settingsProvider
                    .changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light),
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Languages',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: languages.firstWhere((languages) =>
                      languages.code == settingsProvider.languageCode),
                  borderRadius: BorderRadius.circular(20),
                  items: languages
                      .map((languages) => DropdownMenuItem<Language>(
                            value: languages,
                            child: Text(languages.name,
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ))
                      .toList(),
                  onChanged: (selectedLanguage) {
                    if (selectedLanguage != null) {
                      settingsProvider.ChangeLanguage(selectedLanguage.code);
                    }
                  },
                  dropdownColor: settingsProvider.isDark
                      ? AppTheme.darkPrimary
                      : AppTheme.white,
                ),
              ),
            ],
          ),
        ]));
  }
}
