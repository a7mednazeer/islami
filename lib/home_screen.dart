import 'package:flutter/material.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/radio/radio_tab.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCurrentIndex = 0;
  final List<Widget> _screens = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامي'),
        ),
        body: _screens[selectedCurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedCurrentIndex,
          onTap: (index) => {
            selectedCurrentIndex = index,
            setState(() {}),
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/moshaf.png'),
                size: 30,
              ),
              label: 'القران',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/hadeth.png'),
              ),
              label: 'الحدبث',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/sebha.png'),
                size: 30,
              ),
              label: 'سبحه',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/radio.png'),
              ),
              label: 'الراديو',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'الاعدادات',
            ),
          ],
        ),
      ),
    );
  }
}
