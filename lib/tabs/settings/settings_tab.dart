import 'package:flutter/material.dart';
import 'package:islami_app/tabs/settings/language.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'En'),
    Language(name: 'العربية', code: 'Ar'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
          Row(
            children: [
              Text(
                "Dark Theme",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Switch(
                value: true,
                onChanged: (value) {},
              )
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Languages',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: languages.first.code,
                  borderRadius: BorderRadius.circular(20),
                  items: languages
                      .map((languages) => DropdownMenuItem(
                            child: Text(languages.name),
                            value: languages.code,
                          ))
                      .toList(),
                  onChanged: (value) {
                    print(value);
                  },
                ),
              ),
            ],
          ),
        ]));
  }
}
