import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yachaywai/src/presentation/pages/main/menu_screen.dart';
import 'package:yachaywai/src/presentation/providers/login_provider.dart';
import 'package:yachaywai/src/presentation/widgets/custom_button.dart';
import 'package:yachaywai/src/presentation/widgets/custom_textfield.dart';
import 'package:yachaywai/src/presentation/widgets/rounded_image.dart';
import 'package:yachaywai/src/presentation/widgets/yachaywasi_title.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    ),
  );
}

  Future<void> _logIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Todos los campos son obligatorios";
        showSnackBar(context, _errorMessage!);
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      final user = await loginProvider.logIn(email, password);
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MenuScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
        showSnackBar(context, _errorMessage!);
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Error desconocido. Por favor intenta de nuevo.";
        showSnackBar(context, _errorMessage!);
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedImage(
                        imagePath: 'assets/asis/asis-senor.png', 
                        initialRadius: 48.0,
                      ),
                      SizedBox(height: 20.0),
                      YachayWasiTitle(fontSize: 30.0),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Inicio de sesión',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text('Correo electrónico'),
                    const SizedBox(height: 5.0),
                    CustomYachayWasiTextField(
                      hintText: 'Ingresa tu correo electrónico',
                      icon: Icons.email,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20.0),
                    const Text('Contraseña'),
                    const SizedBox(height: 5.0),
                    CustomYachayWasiTextField(
                      hintText: 'Ingresa tu contraseña',
                      icon: Icons.password,
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 20.0),
                    if (_errorMessage != null)
                      Center(
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    const SizedBox(height: 10.0),
                    Center(
                      child: _isLoading
                          ? const CircularProgressIndicator(
                            color: Color.fromARGB(255, 158, 91, 3),
                          )
                          : CustomElevatedButton(
                              text: "Iniciar sesión",
                              onPressed: _logIn,
                            ),
                    ),
                    const SizedBox(height: 20.0),
                    const Center(
                      child: Text(
                        "Si no puedes ingresar consulta con tu docente tus datos de la aplicación",
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 185, 185),
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
