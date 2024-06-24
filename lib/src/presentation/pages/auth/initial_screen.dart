import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:yachaywai/src/presentation/pages/auth/login_screen.dart';
import 'package:yachaywai/src/presentation/pages/main/menu_screen.dart';
import 'package:yachaywai/src/presentation/providers/login_provider.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<bool?> _checkAuth() async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    User? user = FirebaseAuth.instance.currentUser;
    bool? isAuthenticated;
    
    if (user != null) {
      await loginProvider.setCurrentUser(user.uid);
      isAuthenticated = true;
    } else {
      isAuthenticated = false;
    } 

    return isAuthenticated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _checkAuth(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            final isAuthenticated = snapshot.data;
            return isAuthenticated == true ? const MenuScreen() : const LoginScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
