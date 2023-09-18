import 'package:flutter/material.dart';
import 'package:project/style/themes.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class TasbeehPage extends StatefulWidget {
  const TasbeehPage({Key? key}) : super(key: key);

  @override
  State<TasbeehPage> createState() => _TasbeehPageState();
}

class _TasbeehPageState extends State<TasbeehPage> {
  List<String> buttonTexts = ['سبحان الله', 'الحمد لله', 'الله أكبر'];
  int counter = 0;
  int iterator = 0 ;
  String buttonText = 'سبحان الله';
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: provider.appTheme == ThemeMode.dark ? const AssetImage('assets/images/dark_bg.png') : const AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.all(2),
        child: Column(
          children: [
            Transform.scale(
              scale: 1.1,
              child: const Image(
                fit: BoxFit.contain,
                image: AssetImage('assets/images/head_sebha_logo.png'),
              ),
            ),
            Transform.rotate(
              angle: rotationAngle * (3.141592653589793 / 180),
              child: Transform.scale(
                scale: 1.15,
                child: const Image(
                  width: 250,
                  image: AssetImage('assets/images/body_sebha_logo.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
             Text(
              "عدد التسبحات",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                color: const Color(0xffB7935F), // You can set the background color here
              ),
              child: Text(
                counter.toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
                if (counter % 33 == 0) {
                  changeButtonText();
                }
                rotateImage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffB7935F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              ),
              child: Text(
                buttonTexts[iterator],
                style : Theme.of(context).textTheme.bodySmall,
              ),
            )
          ],
        ),
      ),
    );
  }

  void changeButtonText() {
    setState(() {
      if(iterator != 2){
        buttonText = buttonTexts[iterator];
        iterator++;
      }else {
        iterator = 0;
        buttonText = buttonTexts[iterator];
      }
    });
  }

  void rotateImage() {
    setState(() {
      rotationAngle += 10.9; // Rotate by 10.9 degrees (adjust as needed)
    });
  }
}
