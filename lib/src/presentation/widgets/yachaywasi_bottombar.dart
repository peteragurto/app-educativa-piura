// Suggested code may be subject to a license. Learn more: ~LicenseLog:3828057349.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1808534740.
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class YachaywasiBottomBar extends StatelessWidget {
  const YachaywasiBottomBar(
    {super.key, 
    required this.index, 
    required this.onItemTapped
    }
  );
  final int index;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/iconos/hogar.svg', height: 24.0, width: 24.0,),
          activeIcon: SvgPicture.asset('assets/iconos/hogar-1.svg', height: 24.0, width: 24.0,),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/iconos/campana.svg', height: 24.0, width: 24.0,),
          activeIcon: SvgPicture.asset('assets/iconos/campana-1.svg', height: 24.0, width: 24.0,),
          label: "Anuncios",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/iconos/usuario.svg', height: 24.0, width: 24.0,),
          activeIcon: SvgPicture.asset('assets/iconos/hogar-1.svg', height: 24.0, width: 24.0,),
          label: "Perfil",
        ),
      ],
      backgroundColor: const Color.fromARGB(255, 158, 91, 3),
      selectedLabelStyle: const TextStyle(
        color: Colors.white,
        fontSize: 12.0,
      ),
      unselectedLabelStyle: const TextStyle(
        color: Colors.black,
        fontSize: 12.0,
      ),
    );
  }
}
