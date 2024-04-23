import 'package:flutter/material.dart';
import 'package:yachaywai/Menu/perfil.dart';

import '../screens/bienvenida.dart';
import 'cursos.dart';
import 'flujoactividades.dart';
import 'eventos.dart';
import 'contenedor.dart';
import 'citaspsicologicas.dart';
import 'notificaciones.dart';

String nombres = "VIVIANA";
String tituloAppBar = 'BIENVENIDA $nombres';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = ContactsPage();
    } else if (currentPage == DrawerSections.events) {
      container = EventsPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          tituloAppBar,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 19,
            shadows: [
              Shadow(
                color: Colors.tealAccent,
                offset: Offset(1.0, 1.0),
                blurRadius: 30.0,
              ),
            ],
          ),
        ),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Flujo de actividades", Icons.menu_book,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Cursos", Icons.book_rounded,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Eventos", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Citas psicologicas", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
          menuItem(5, "Perfil", Icons.person,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(6, "Notificaciones", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          SizedBox(
            height: 200,
          ),
          menuItem(7, "Cerrar sesión", Icons.exit_to_app_rounded,
              currentPage == DrawerSections.salir ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
              tituloAppBar = 'BIENVENIDA $nombres';
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
              tituloAppBar = 'CURSOS';
            } else if (id == 3) {
              currentPage = DrawerSections.events;
              tituloAppBar = 'EVENTOS';
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
              tituloAppBar = 'CITAS PSCICOLOGICAS';
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
              tituloAppBar = 'PERFIL';
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
              tituloAppBar = 'NOTIFICACIONES';
            } else if (id == 7) {
              tituloAppBar = 'BIENVENIDA $nombres';
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  salir,
}
