import 'package:flutter/material.dart';

import '../CalendarioLista/DemoApp.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return CalendarPage();
  }
}
