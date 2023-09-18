import 'package:flutter/material.dart';
import 'package:project/UI/Screens/quran_page.dart';
import 'package:project/UI/Screens/radio_page.dart';
import 'package:project/UI/Screens/sebha_page.dart';
import 'package:project/UI/Screens/settings_screen.dart';
import 'package:project/provider/app_provider.dart';
import 'package:provider/provider.dart';
import 'ahadeth_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 4;

  List<Widget> bottomScreens = [
    SettingsScreen(),
    RadioPage(),
    TasbeehPage(),
    AhadethPage(),
    QuranPage(),
  ];

  void changeBottomNav(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.app_title ,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: bottomScreens[currentIndex],//0xff141A2E
      bottomNavigationBar: Theme(
        data: provider.appTheme == ThemeMode.light ? Theme.of(context).copyWith(canvasColor: const Color(0xffb08f5d)) : Theme.of(context).copyWith(canvasColor: const Color(0xff141A2E)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings), label: AppLocalizations.of(context)!.settings),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/icon_radio.png')), label: AppLocalizations.of(context)!.radio , ),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/icon_sebha.png')), label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/icon_hadeth.png')), label:AppLocalizations.of(context)!.hadeth ),
            BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage('assets/images/icon_quran.png')), label: AppLocalizations.of(context)!.quran),
          ],
          onTap: (index) {
            changeBottomNav(index);
          },
          iconSize: 40,
        ),
      ),
    );
  }
}