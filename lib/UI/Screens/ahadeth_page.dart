import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AhadethPage extends StatelessWidget {
  const AhadethPage({Key? key}) : super(key: key);

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
      child:  SafeArea(
        minimum: const EdgeInsets.all(2),
        child: Column(
          children: [
            Image(
              fit: BoxFit.contain,
              image: AssetImage('assets/images/hadeth_logo.png'),
            ),
            Container(
              height: 3,
              color: Color(0xffB7935F),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
              child: Text(
                "الاحاديث",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 3,
              color: Color(0xffB7935F),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Center(
                  child: Text(
                    "الحديث رقم ${index + 1}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
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
    );
  }
}
