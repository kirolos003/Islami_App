import 'package:flutter/material.dart';
import 'package:project/UI/Screens/quran_page.dart';
import 'package:project/UI/Screens/radio_page.dart';
import 'package:project/UI/Screens/sebha_page.dart';
import 'ahadeth_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 3;

  List<Widget> bottomScreens = [
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("اسلامي" , style: TextStyle(
          color: Colors.black,
          fontSize: 30 ,
          fontWeight: FontWeight.w700
        ),),
      ),
      body: bottomScreens[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0xffb08f5d)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_radio.png'), label: "الراديو"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_sebha.png'), label: "التسبيح "),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_hadeth.png'), label: "الآحاديث"),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_quran.png'), label: "القرآن"),
          ],
          onTap: (index) {
            changeBottomNav(index);
          },
          selectedItemColor: Color(0xff252525),
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}