import 'package:flutter/material.dart';
import 'package:islami/tabs/quran/sura_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class QuranTab extends StatelessWidget {
  QuranTab({super.key});
  final List<String> suraName = [
    "الفاتحة",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/quran_header.png',
          height: MediaQuery.sizeOf(context).height * 0.30,
        ),
        Divider(
          height: 5,
          thickness: 2.5,
          // indent: 25,
          // endIndent: 25,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Text(
              //   'عدد الآيات',
              //   style: Theme.of(context).textTheme.titleLarge,
              // ),
              Text(
                AppLocalizations.of(context)!.sura,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        Divider(
          height: 5,
          // indent: 25,
          // endIndent: 25,
          thickness: 2.5,
          color: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                // Expanded(
                //   child: ListView.builder(
                //     itemBuilder: (_, index) => Text(
                //       '00',
                //       style: Theme.of(context).textTheme.headlineSmall,
                //       textAlign: TextAlign.center,
                //     ),
                //     itemCount: suraName.length,
                //   ),
                // ),
                // VerticalDivider(
                //   width: 30,
                //   thickness: 2.5,
                //   color: Theme.of(context).primaryColor,
                // ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        SuraScreen.routeName,
                        arguments: SuraScreenArguments(
                          suraName: suraName[index],
                          suraNumber: index,
                        ),
                      ),
                      child: Text(
                        suraName[index],
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    itemCount: suraName.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SuraScreenArguments {
  String suraName;
  int suraNumber;

  SuraScreenArguments({required this.suraName, required this.suraNumber});
}
