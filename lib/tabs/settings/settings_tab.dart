import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/language.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
                onChanged: (isDark) => settingsProvider.changeTheme(
                  isDark ? ThemeMode.dark : ThemeMode.light,
                ),
                activeColor: AppTheme.gold,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton<Language>(
                  value: languages.firstWhere((language) =>
                      language.code == settingsProvider.languageCode),
                  items: languages
                      .map(
                        (language) => DropdownMenuItem<Language>(
                          value: language,
                          child: Text(
                            language.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: settingsProvider.isDark
                                      ? AppTheme.white
                                      : AppTheme.black,
                                ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedLanguage) {
                    if (selectedLanguage != null) {
                      settingsProvider.changeLanguage(selectedLanguage.code);
                    }
                  },
                  borderRadius: BorderRadius.circular(15),
                  dropdownColor: settingsProvider.isDark
                      ? AppTheme.darkPrimary
                      : AppTheme.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
