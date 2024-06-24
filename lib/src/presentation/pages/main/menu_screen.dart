import 'package:flutter/material.dart';
import 'package:yachaywai/src/presentation/pages/main/anuncios_screen.dart';
import 'package:yachaywai/src/presentation/pages/main/profile_screen.dart';
import 'package:yachaywai/src/presentation/pages/main/welcome_screen.dart';
import 'package:yachaywai/src/presentation/widgets/yachaywasi_bottombar.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  final List<Widget> _screens = [
    const WelcomeScreen(),
    const AnnouceScren(), // Asegúrate de tener esta pantalla implementada
    const ProfileScreen(),
  ];

  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    pageController.jumpToPage(index);
  }

  final PageController pageController = PageController(
    initialPage: 0
  );	
  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SafeArea(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: _screens,
          ),
        ),
        bottomNavigationBar: YachaywasiBottomBar(
          index: currentIndex,
          onItemTapped: onItemTapped,
        ),
      );
  }
}