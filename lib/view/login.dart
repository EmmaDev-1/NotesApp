// lib/view/login_page.dart
import 'package:flutter/material.dart';
import 'package:note_app/Utils/Navigation/navegationAnimationRightLeft.dart';
import 'package:note_app/Utils/Navigation/navigationAnimationLeftRight.dart';
import 'package:note_app/components/mediaAuth.dart';
import 'package:note_app/view/dashboard.dart';
import 'package:note_app/view/register.dart';
import 'package:note_app/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginUser() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _showErrorDialog(
        'Incomplete Form',
        'All fields must be filled out.',
      );
      return;
    }

    _showLoadingDialog();

    try {
      final loginViewModel =
          Provider.of<LoginViewModel>(context, listen: false);
      await loginViewModel.loginUser(
        email: emailController.text,
        password: passwordController.text,
      );

      Navigator.pop(context);

      Navigator.push(
        context,
        crearRuta(context, const DashboardPage()), // Navega al Dashboard
      );
    } catch (e) {
      Navigator.pop(context);
      _showErrorDialog(
        'Login Error',
        e.toString(),
      );
    }
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 255, 94, 0)),
          ),
        );
      },
    );
  }

  Future<void> _showErrorDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.03,
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
              child: _loginForm(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Log In',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.05,
              fontWeight: FontWeight.bold,
              fontFamily: 'QuickSand-Bold',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.07),
        _buildTextField(
          controller: emailController,
          hintText: 'User',
          prefixIcon: Icons.person_rounded,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        _buildTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: _obscureText,
          onChanged: (text) {
            setState(() {
              _obscureText = text.isEmpty ? true : _obscureText;
            });
          },
          prefixIcon: Icons.lock_rounded,
          suffixIcon: passwordController.text.isEmpty
              ? null
              : IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Container(
          height: MediaQuery.of(context).size.height * 0.065,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            onPressed: _loginUser,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
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
                    color: const Color.fromARGB(255, 255, 0, 0),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.15),
        const MediaAuth(),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    Function(String)? onChanged,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.074,
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(0, 116, 73, 73),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(143, 255, 0, 0),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 255, 0, 0),
              width: 1.0,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.045,
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          contentPadding: const EdgeInsets.all(16.0),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon,
                  size: 20, color: Theme.of(context).colorScheme.inversePrimary)
              : null,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
