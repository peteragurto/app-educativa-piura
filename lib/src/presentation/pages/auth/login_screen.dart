import 'package:flutter/material.dart';
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
                // Centramos la imagen y el título verticalmente
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedImage(
                        imagePath: 'assets/asis/asis-senor.png', 
                        initialRadius: 48.0
                      ),
                      SizedBox(height: 20.0),
                      YachayWasiTitle(fontSize: 30.0),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                // Formulario de inicio de sesión
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
                    Center(
                      child: CustomElevatedButton(
                        text: "Iniciar sesión", 
                        onPressed:() {}
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Center(
                      child: Text(
                        "Si no puedes ingresar consulta con tu docente tus datos de la aplicación",
                        style: TextStyle(
                          color: Color.fromARGB(255, 185, 185, 185),
                          fontSize: 12.0
                        ),
                        textAlign: TextAlign.center,
                        
                      ),
                    )
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