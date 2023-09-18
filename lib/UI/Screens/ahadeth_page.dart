import 'package:flutter/material.dart';
import 'package:project/UI/Screens/detailed_screen.dart';
import 'package:project/style/themes.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class AhadethPage extends StatelessWidget {
  @override
  List <String> ahadeethNames = List.generate(50, (index) =>"الحديث رقم ${index + 1}");
  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: provider.isDark ? const AssetImage('assets/images/dark_bg.png') : const AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child:  SafeArea(
        minimum: const EdgeInsets.all(2),
        child: Column(
          children: [
            const Image(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/hadeth_logo.png'),
            ),
            Container(
              height: 3,
              color: const Color(0xffB7935F),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 7),
              child:  Text(
                "الاحاديث",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              height: 3,
              color: const Color(0xffB7935F),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DetailsScreen(
                          arg: SuraDetailsArguments(
                              name : ahadeethNames[index],
                              index: index ,
                              isQuran: false,
                          ),
                        )
                        )
                    );
                  },
                  child: Center(
                    child: Text(
                      ahadeethNames[index],
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: ahadeethNames.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
