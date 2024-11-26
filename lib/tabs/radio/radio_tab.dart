import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/radio_logo.png',
            height: MediaQuery.sizeOf(context).height * 0.30,
          ),
          Text(
            AppLocalizations.of(context)!.sound,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color:
                      settingsProvider.isDark ? AppTheme.white : AppTheme.black,
                ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_double_arrow_right,
                  size: 50,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow,
                  size: 50,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.keyboard_double_arrow_left,
                  size: 50,
                  color: settingsProvider.isDark
                      ? AppTheme.gold
                      : AppTheme.lightPrimary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
