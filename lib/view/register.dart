import 'package:flutter/material.dart';
import 'package:note_app/components/mediaAuth.dart';
import 'package:note_app/utils/Navigation/navegationAnimationRightLeft.dart';
import 'package:note_app/utils/Navigation/navigationAnimationLeftRight.dart';
import 'package:note_app/view/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Variables Sectio
  late bool _obscureText = true;
  late bool _obscureTextRepeat = true;

  //Controllers
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordControllerRepeat = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordControllerRepeat.dispose();
    super.dispose();
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
            'Sign Up',
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
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.42,
              child: TextField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                controller: emailController,
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

                  hintText: 'First Name',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ), // Texto por defecto
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.42,
              child: TextField(
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                controller: emailController,
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

                  hintText: 'Last Name',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ), // Texto por defecto
                  contentPadding: EdgeInsets.all(15.0),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 1,
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

              hintText: 'Email',
              hintStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.045,
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.inversePrimary,
              ), // Texto por defecto
              contentPadding: EdgeInsets.all(15.0),
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

                contentPadding: EdgeInsets.all(15.0),
              ),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              controller: passwordControllerRepeat,
              obscureText: _obscureTextRepeat,
              onChanged: (text) {
                setState(() {
                  // Actualiza el estado del icono del ojo al escribir
                  _obscureTextRepeat = text.isEmpty ? true : _obscureTextRepeat;
                });
              },
              decoration: InputDecoration(
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
                hintText: 'Confirm Password',
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                suffixIcon: passwordControllerRepeat.text.isEmpty
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
                            _obscureTextRepeat = !_obscureTextRepeat;
                          });
                        },
                      ),

                contentPadding: EdgeInsets.all(15.0),
              ),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(crearRuta(context, LoginPage()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(
                  255, 255, 0, 0), // Puedes cambiar el color aquí
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text(
              'Sign up',
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
                crearRutaIzquierdaADerecha(context, const LoginPage()),
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
                    const TextSpan(text: 'Already have an account? '),
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: Color.fromARGB(
                            255, 255, 0, 0), // Cambia aquí el color del texto
                      ),
                    ),
                  ],
                ))),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        MediaAuth()
      ],
    );
  }
}
