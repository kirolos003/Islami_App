import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _RadioPageState();
}

class _RadioPageState extends State<SettingsScreen> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: provider.isDark ? AssetImage('assets/images/dark_bg.png') : AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.all(2),
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.settings ,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(AppLocalizations.of(context)!.language ,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10,),
              InkWell(
                onTap: (){
                  showLanguageBottomSheet();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(provider.isEnglish == 'en' ? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic ,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Icon(Icons.arrow_drop_down_outlined)
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25
              ),
              Text(AppLocalizations.of(context)!.theme ,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10,),
              InkWell(
                onTap: (){
                  showThemeBottomSheet();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(provider.isDark ? AppLocalizations.of(context)!.dark : AppLocalizations.of(context)!.light ,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Icon(Icons.arrow_drop_down_outlined)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) => LangugeBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context, builder: (context) => ThemeBottomSheet());
  }
}

class LangugeBottomSheet extends StatelessWidget{
  const LangugeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              provider.changeAppLanguage();
            },
            child: Text(AppLocalizations.of(context)!.english ,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: provider.isDark ? Colors.black :  Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              provider.changeAppLanguage();
            },
            child: Text(AppLocalizations.of(context)!.arabic ,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: provider.isDark ? Colors.black : Colors.black,
    ),
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              provider.changeAppTheme();
            },
            child: Text(AppLocalizations.of(context)!.light ,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: provider.isDark ? Colors.black :  Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              provider.changeAppTheme();
            },
            child: Text(AppLocalizations.of(context)!.dark ,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: provider.isDark ? Colors.black :  Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
