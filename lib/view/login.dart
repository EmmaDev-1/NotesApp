import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (context) => SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 1,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Stack(
                          children: [
                            Container(
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
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.30,
                              child: login(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )));
  }

  Widget login() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 1,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.06,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.height * 0.02,
            ),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 1,
            child: _animacionEjecutada
                ? TyperAnimatedTextKit(
                    isRepeatingAnimation: false,
                    speed: const Duration(
                        milliseconds:
                            150), // Ajusta la velocidad de la animación
                    text: const ['Hi,\nWelcome Back...'],
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.1,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'QuickSand',
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.start,
                  )
                : Container(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(
                    255, 215, 215, 215), // Color de fondo gris
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(30.0), // Bordes redondeados
                  borderSide: BorderSide.none, // Sin borde
                ),
                hintText: 'User',
                hintStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontFamily: 'QuickSand',
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ), // Texto por defecto
                prefixIcon: const Icon(Icons.person_outline_rounded,
                    color: Color.fromARGB(
                        255, 83, 83, 83)), // Icono a la izquierda
                // Puedes agregar más propiedades de estilo según tus necesidades
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: TextField(
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
                  fillColor: const Color.fromARGB(
                      255, 215, 215, 215), // Color de fondo gris
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Bordes redondeados
                    borderSide: BorderSide.none, // Sin borde
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    fontFamily: 'QuickSand',
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  prefixIcon: const Icon(Icons.lock_outline_rounded,
                      color: Color.fromARGB(
                          255, 83, 83, 83)), // Icono a la izquierda
                  suffixIcon: passwordController.text.isEmpty
                      ? null
                      : IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(
                                255, 83, 83, 83), // Color del icono del ojo
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                  // Puedes agregar más propiedades de estilo según tus necesidades
                ),
              )),
          Container(
            height: MediaQuery.of(context).size.height * 0.047,
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  crearRuta(context, const registerPage()),
                );
              },
              child: Text(
                'Don\'t have and account? Sign Up Here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'QuickSand-Bold',
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 0.8,
            alignment: Alignment.center,
            child: Text(
              'Default user: test@gmail.com\nDefault password: 123456',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.035,
                fontFamily: 'QuickSand',
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: ElevatedButton(
              onPressed: () => signIn(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 255, 94, 0), // Puedes cambiar el color aquí
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
