import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: const Color(0xffB7935F),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    color: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30 ,
        fontWeight: FontWeight.w700
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xff252525),
    unselectedItemColor: Colors.white,
    selectedIconTheme: IconThemeData(
      color:  Color(0xff252525),
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffB7935F),
    primary: const Color(0xffB7935F),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600
    ),
    bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w400),
    titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 30 ,
        fontWeight: FontWeight.w700
    ),
  ),

);

ThemeData darkTheme = ThemeData(
  primaryColor: const Color(0xffB7935F),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    color: Colors.transparent,
    centerTitle: true,
    elevation: 0,
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 30 ,
        fontWeight: FontWeight.w700
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: const Color(0xffFACC1D),
    unselectedItemColor: Colors.white,
    selectedIconTheme: IconThemeData(
      color: const Color(0xffFACC1D),
    ),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600
    ),
    bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w400),
    titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 30 ,
        fontWeight: FontWeight.w700
    ),
  ),
);