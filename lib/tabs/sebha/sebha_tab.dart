import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  int index = 0;

  List<String> zekr = [
    'سبحان اللَّهُ',
    'الحمد للَّهُ',
    'اللَّهُ أكبر',
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.sizeOf(context).width * 0.1),
                child: Image.asset(
                  settingsProvider.themeMode == ThemeMode.light
                      ? 'assets/images/head_sebha_logo.png'
                      : 'assets/images/head_sebha_dark.png',
                  height: MediaQuery.sizeOf(context).height * 0.08,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * 0.06),
                child: Image.asset(
                  settingsProvider.themeMode == ThemeMode.light
                      ? 'assets/images/body_sebha_logo.png'
                      : 'assets/images/body_sebha_dark.png',
                  height: MediaQuery.sizeOf(context).height * 0.20,
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            AppLocalizations.of(context)!.tasbeh,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 30,
                  color:
                      settingsProvider.isDark ? AppTheme.white : AppTheme.black,
                ),
          ),
          SizedBox(height: 30),
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              color: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.lightPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 25,
                      color: settingsProvider.isDark
                          ? AppTheme.gold
                          : AppTheme.white,
                    ),
              ),
            ),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              onClick();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: settingsProvider.isDark
                  ? AppTheme.darkPrimary
                  : AppTheme.lightPrimary,
              maximumSize: Size(175, 50),
              minimumSize: Size(175, 50),
            ),
            child: Text(
              zekr[index],
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 25,
                    color: settingsProvider.isDark
                        ? AppTheme.gold
                        : AppTheme.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void onClick() {
    // Add your logic here
    if (count < 33) {
      count++;
    } else {
      count = 0;
      index++;
      if (index == zekr.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
