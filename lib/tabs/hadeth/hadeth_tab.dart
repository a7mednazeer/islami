import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }

    return Column(
      children: [
        Image.asset(
          'assets/images/hadith_header.png',
          height: MediaQuery.sizeOf(context).height * 0.30,
        ),
        Divider(
          height: 5,
          thickness: 2.5,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                AppLocalizations.of(context)!.hadeth,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Divider(
          height: 5,
          thickness: 2.5,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, HadethScreen.routeName,
                          arguments: HadethScreenArguments(
                              title: ahadeth[index].title,
                              hadeth: ahadeth[index].content)),
                      child: Text(
                        ahadeth[index].title,
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    itemCount: ahadeth.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> loadHadethFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/hadeth/ahadeth.txt');
    List<String> ahadethStrings = ahadethContent.split('#');
    ahadeth = ahadethStrings.map((hadethString) {
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines.first;
      List<String> content = hadethLines.sublist(1, hadethLines.length);
      return Hadeth(title, content);
    }).toList();
    setState(() {});
  }
}

class HadethScreenArguments {
  String title;
  List<String> hadeth;

  HadethScreenArguments({required this.title, required this.hadeth});
}
