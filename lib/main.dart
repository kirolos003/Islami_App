import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/Network/local/cache_helper.dart';
import 'package:project/provider/app_provider.dart';
import 'package:project/shared/components.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/style/themes.dart';
import 'package:provider/provider.dart';
import 'UI/Screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isDark = await CacheHelper.getData(key:'isDark');
  String? isEnglish = await CacheHelper.getData(key:'isEnglish');
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider()..changeAppTheme(fromShared: isDark)..changeAppLanguage(fromShared: isEnglish), child: MyApp(isDark: isDark , isEnglish : isEnglish)));
  }


class MyApp extends StatelessWidget {
  final bool? isDark;
  final String? isEnglish;
  MyApp({required this.isDark , required this.isEnglish});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: darkTheme,
      theme: lightTheme,
      locale: Locale(provider.isEnglish  == 'en' ? 'en' : 'ar'),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      navigateAndFinish(context, HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                provider.isDark ?
                'assets/images/splash_dark – 1.png' : 'assets/images/splash.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}

