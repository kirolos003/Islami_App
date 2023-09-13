import 'package:flutter/material.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({Key? key}) : super(key: key);

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
          children: [
            Image(
              image: AssetImage('assets/images/qur2an_screen_logo.png'),
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 3,
              color: Color(0xffB7935F),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
              child: Row(
                children: [
                  Text(
                    "عدد الآيات",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  Text(
                    "اسم السوره",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              height: 3,
              color: Color(0xffB7935F),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Row(
                          children: [
                            Text(
                              "286",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 170,
                            ),
                            Text(
                              "عدد الآيات",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        itemCount: 8,
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
