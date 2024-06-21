import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:note_app/Utils/Navigation/navegationAnimationRightLeft.dart';
import 'package:note_app/Utils/Navigation/navigationAnimationLeftRight.dart';
import 'package:note_app/view/login.dart';
import 'package:note_app/view/register.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //variables section
  bool _animacionEjecutada = false;
  bool _animacionIniciada = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_animacionIniciada) {
        _iniciarAnimacion();
      }
    });
  }

  void _iniciarAnimacion() async {
    // Simula un retraso de 1 segundo
    await Future.delayed(const Duration(seconds: 1));
    // Actualiza el estado solo si el widget está todavía en el árbol de widgets
    if (mounted) {
      setState(() {
        _animacionEjecutada = true;
        _animacionIniciada = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (context) => Container(
                  height: MediaQuery.of(context).size.height * 1,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 40, 36, 82),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      logoSection(),
                      accesSection(),
                      //socialMediaLoginSection()
                    ],
                  ),
                )));
  }

  logoSection() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/noteLogo.png',
            scale: 5,
          ),
        ),
        Text(
          "My Notes",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.05,
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'QuickSand-Bold',
          ),
        )
      ],
    );
  }

  accesSection() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 1,
          child: _animacionEjecutada
              ? TyperAnimatedTextKit(
                  isRepeatingAnimation: false,
                  speed: const Duration(
                      milliseconds: 150), // Ajusta la velocidad de la animación
                  text: const ['Welcome...'],
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.035,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'QuickSand-Bold',
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              : Container(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(crearRutaIzquierdaADerecha(context, LoginPage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(
                  255, 255, 0, 0), // Puedes cambiar el color aquí
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'QuickSand-Bold',
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
            onPressed: () {
              Navigator.push(
                context,
                crearRuta(context, const RegisterPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 255, 0, 0), // Puedes cambiar el color aquí
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Sign Up',
              style: TextStyle(
                fontFamily: 'QuickSand-Bold',
                fontSize: 18.0,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
