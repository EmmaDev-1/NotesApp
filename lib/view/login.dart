import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:note_app/components/mediaAuth.dart';
import 'package:note_app/utils/Navigation/navegationAnimationRightLeft.dart';
import 'package:note_app/utils/Navigation/navigationAnimationLeftRight.dart';
import 'package:note_app/view/dashboard.dart';
import 'package:note_app/view/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Variables Sectio
  late bool _obscureText = true;
  late TextEditingController emailController;
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Builder(
            builder: (context) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 1,
                        width: MediaQuery.of(context).size.width * 1,
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * 0.03,
                          right: MediaQuery.of(context).size.height * 0.03,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).colorScheme.tertiary,
                              Theme.of(context).colorScheme.background,
                            ],
                          ),
                        ),
                        child: loginSection(),
                      )
                    ],
                  ),
                )));
  }

  loginSection() {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Log In',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.05,
              fontWeight: FontWeight.bold,
              fontFamily: 'QuickSand-Bold',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.074,
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            controller: emailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(0, 116, 73, 73), // Color de fondo gris
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                borderSide: BorderSide.none, // Sin borde por defecto
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                borderSide: BorderSide(
                  color: Color.fromARGB(
                      143, 255, 0, 0), // Cambia aquí el color del borde
                  width: 1.0, // Ancho del borde
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 255, 0, 0),
                  width: 1.0, // Ancho del borde
                ),
              ),

              hintText: 'User',
              hintStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.045,
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inversePrimary,
              ), // Texto por defecto
              prefixIcon: Icon(
                Icons.person_rounded,
                size: 20,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.074,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              controller: passwordController,
              obscureText: _obscureText,
              onChanged: (text) {
                setState(() {
                  // Actualiza el estado del icono del ojo al escribir
                  _obscureText = text.isEmpty ? true : _obscureText;
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor:
                    Color.fromARGB(0, 116, 73, 73), // Color de fondo gris
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin borde por defecto
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                        143, 255, 0, 0), // Cambia aquí el color del borde
                    width: 1.0, // Ancho del borde
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 0, 0),
                    width: 1.0, // Ancho del borde
                  ),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                prefixIcon: Icon(
                  Icons.lock_rounded,
                  size: 20,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ), // Icono a la izquierda
                suffixIcon: passwordController.text.isEmpty
                    ? null
                    : IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),

                contentPadding: EdgeInsets.all(16.0),
              ),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(crearRuta(context, DashboardPage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(
                  255, 255, 0, 0), // Puedes cambiar el color aquí
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 18.0,
                fontFamily: 'QuickSand-Bold',
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.push(
                context,
                crearRutaIzquierdaADerecha(context, const RegisterPage()),
              );
            },
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontFamily: 'QuickSand-Bold',
                  ),
                  children: [
                    const TextSpan(text: 'Don\'t have an account? '),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        fontFamily: 'QuickSand-Bold',
                        color: Color.fromARGB(
                            255, 255, 0, 0), // Cambia aquí el color del texto
                      ),
                    ),
                  ],
                ))),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        MediaAuth()
      ],
    );
  }
}
