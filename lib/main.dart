import 'dart:async';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  ThemeMode? theme = await CacheHelper.getData(key:'theme');
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(), child: MyApp(theme: theme,)));
}

class MyApp extends StatelessWidget {
  ThemeMode? theme;
  MyApp({required this.theme});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: provider.appTheme,
      darkTheme: darkTheme,
      theme: lightTheme,
      locale: Locale(provider.appLanguage),
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
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/splash.png',
                width: double.infinity,
                height: double.infinity, // Set the height to fill the screen
                fit: BoxFit.cover, // Optional: Adjust the image's fit as needed
              ),
            )
          ],
        ),
      ),
    );
  }
}

