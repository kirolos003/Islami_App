import 'package:flutter/material.dart';

class TasbeehPage extends StatefulWidget {
  const TasbeehPage({Key? key}) : super(key: key);

  @override
  State<TasbeehPage> createState() => _TasbeehPageState();
}

class _TasbeehPageState extends State<TasbeehPage> {
  String buttonText = 'سبحان الله';
  int counter = 0 ;
  double rotationAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
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
              child : Transform.scale(
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
            const Text(
              "عدد التسبحات",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
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
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  counter++;
                });
                  ButtonPressed(text: buttonText);
                  if(counter == 33){
                    counter = 0;
                  }
                  rotateImage();
              },
                child: Text(
                  buttonText ,
                  style: TextStyle(
                    fontSize: 25 ,
                    fontWeight: FontWeight.w400
                  ),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffB7935F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  void ButtonPressed({required String text}){
    if(text == 'سبحان الله' && counter == 33){
      setState(() {
        buttonText = 'الحمدلله';
      });
    }if(text == 'الحمدلله' && counter == 33){
      setState(() {
        buttonText = 'الله أكبر';
      });
    }if(text == 'الله أكبر' && counter == 33){
      setState(() {
        buttonText = 'سبحان الله';
      });
    }
  }
  void rotateImage() {
    setState(() {
      rotationAngle += 10.9; // Rotate by 45 degrees (adjust as needed)
    });
  }
}
