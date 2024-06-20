import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 134, 78, 199),
                        Color.fromARGB(255, 93, 19, 177)
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      logoSection(),
                      loginSection(),
                      //socialMediaLoginSection()
                    ],
                  ),
                )));
  }

  logoSection() {
    return Column(
      children: [
        Icon(
          Icons.note,
          color: Colors.white,
          size: 50,
        ),
        Text(
          "My Notes",
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.035,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        )
      ],
    );
  }

  loginSection() {
    return Column(
      children: [
        Text(
          'Welcome',
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.04,
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 255, 94, 0), // Puedes cambiar el color aquí
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 255, 94, 0), // Puedes cambiar el color aquí
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 18.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ],
    );
  }

  socialMediaLoginSection() {}
}
