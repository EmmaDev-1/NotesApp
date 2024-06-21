import 'package:flutter/material.dart';

class MediaAuth extends StatelessWidget {
  const MediaAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 1,
              color: Color.fromARGB(158, 184, 184, 184),
            ),
            Text(
              '  Or continue with  ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'QuickSand',
                color: Color.fromARGB(193, 170, 170, 170),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: 1,
              color: Color.fromARGB(158, 184, 184, 184),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.24,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 242, 242),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        width: 2)),
                child: Image.asset(
                  'assets/images/googleLogo.png',
                  scale: 6.5,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.24,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 245, 245),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        width: 2)),
                child: Image.asset('assets/images/appleLogo.png', scale: 6.5),
              ),
            ),
          ],
        )
      ],
    );
  }
}
