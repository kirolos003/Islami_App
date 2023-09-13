import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.all(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Image(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/radio_image.png'),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "   اذاعة القرآن الكريم",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              // Center horizontally and vertically
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center, // Center horizontally
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_previous,
                        color: Color(0xffB7935F),
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying; // Toggle the playing state
                        });
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Color(0xffB7935F),
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next,
                        color: Color(0xffB7935F),
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
