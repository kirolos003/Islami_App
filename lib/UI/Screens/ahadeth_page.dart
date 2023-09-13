import 'package:flutter/material.dart';

class AhadethPage extends StatelessWidget {
  const AhadethPage({Key? key}) : super(key: key);

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
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
              child: const Text(
                "الاحاديث",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
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
                itemBuilder: (context, index) => Center(
                  child: Text(
                    "الحديث رقم ${index + 1}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
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
