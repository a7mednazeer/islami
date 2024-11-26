import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/settings/settings_provider.dart';
import 'package:islami/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SuraScreen extends StatefulWidget {
  SuraScreen({super.key});
  static const String routeName = '/sura';

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String> ayat = [];

  late SuraScreenArguments args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraScreenArguments;
    if (ayat.isEmpty) {
      loadSuraFile();
    }

    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/${settingsProvider.backgroundImageName}.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.islami),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          decoration: BoxDecoration(
            color:
                settingsProvider.isDark ? AppTheme.darkPrimary : AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'سورة ${args.suraName}',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: settingsProvider.isDark
                              ? AppTheme.white
                              : AppTheme.black,
                        ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle,
                      size: 30,
                      color: settingsProvider.isDark
                          ? AppTheme.white
                          : AppTheme.black,
                    ),
                  ),
                ],
              ),
              Divider(
                height: 5,
                thickness: 2.5,
                color: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: ayat.isEmpty
                    ? LoadingIndicator()
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 15),
                        itemBuilder: (_, index) => Text(
                          ayat[index] + '(${index + 1})',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        itemCount: ayat.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    await Future.delayed(const Duration(seconds: 1), () {});
    String sura =
        await rootBundle.loadString('assets/sura/${args.suraNumber + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
  }
}
