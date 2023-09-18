import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Network/local/cache_helper.dart';

class AppProvider extends ChangeNotifier {
    String appLanguage = 'en';

    void changeAppLanguage(String newLanguage){
      if(appLanguage == newLanguage){
        return;
      }else{
        appLanguage = newLanguage;
        notifyListeners();
      }
    }

    ThemeMode appTheme = ThemeMode.light;

    void changeAppTheme(ThemeMode newTheme){
      if(appTheme == newTheme){
        CacheHelper.saveData(key: 'theme', value: appTheme).then((value) =>
            notifyListeners()
        );
      }else{
        appTheme = newTheme;
        CacheHelper.saveData(key: 'theme', value: newTheme).then((value) =>
            notifyListeners()
        );
        notifyListeners();
      }
    }
}
