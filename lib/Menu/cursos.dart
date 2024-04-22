

import 'package:flutter/material.dart';


class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListaCursos1(context),
            ListaCursos2(context),
            ListaCursos3(context),
            ListaCursos4(context),
            ListaCursos5(context),
            ListaCursos6(context),
            ListaCursos7(context),
            ListaCursos8(context),
            ListaCursos9(context),
            ListaCursos10(context),
            ListaCursos11(context),
          ],
        ),
      ),
    );
  }
}

class SegundaVentana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda ventana')),
      body: Center(child: Text('Bienvenido a la segunda ventana')),
    );
  }
}
Widget ListaCursos1(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SegundaVentana()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset('assets/iconos/mate.png'),
          Column(
            children: [
              Text('MATEMATICAS',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10,),
              Text('Exploremos el fascinante mundo\nde las matemáticas, donde cada \nnúmero y problema es un nuevo \ndesafío',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
Widget ListaCursos2(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ), // LinearGradient
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
        },
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/comunicacion.png'),
        Column(
          children: [
            Text('COMUNICACIÓN',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('Cultivando habilidades lingüísticas\n que nos acompañarán a lo largo\n de toda la vida',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
    ),
  );
}
Widget ListaCursos3(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: InkWell(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
      },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/arte.png'),
        Column(
          children: [
            Text('ARTE',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('Explora tu creatividad y expresa\n tu singularidad, descubriendo\n colores, formas y texturas ',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
    ),
  );
}
Widget ListaCursos4(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ),
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),

      child: InkWell(
      onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
      },
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/computacion.png'),
        Column(
          children: [
            Text('COMPUTACION',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('Introducete al emocionante mundo\n de la tecnología, donde aprenderas\n a navegar por el ciberespacio ',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
      ),
  );
}
Widget ListaCursos5(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ), // EdgeInsets.symmetric
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ), // LinearGradient
      borderRadius: BorderRadius.circular(20.0),
    ),
      child: InkWell(
      onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
      },
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/cta.png'),
        Column(
          children: [
            Text('CIENCIAS Y TECNOLOGIA',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('La ciencia y tecnología se\nentrelazan para inspirarnos a \nobservar, preguntar y descubrir',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
      ),
  );
}
Widget ListaCursos6(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ), // EdgeInsets.symmetric
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ), // LinearGradient
      borderRadius: BorderRadius.circular(20.0),
    ), // BoxDecoration
  child: InkWell(
      onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
      },
  child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/ingles.png'),
        Column(
          children: [
            Text('INGLES',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('Exploremos nuevas palabras, \nconstruyamos frases y asi \ndescubre la riqueza cultural\n que el inglés ofrece',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
  ),
  );
}
Widget ListaCursos7(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ), // EdgeInsets.symmetric
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ), // LinearGradient
      borderRadius: BorderRadius.circular(20.0),
    ),
  child: InkWell(
        onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
        },
  child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/personasocial.png'),
        Column(
          children: [
            Text('PERSONA SOCIAL',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('Busca y disfruta de la interacción\n con otros individuos, a través de\n conexiones y relaciones',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
  ),
  );
}
Widget ListaCursos8(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ), // EdgeInsets.symmetric
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ), // LinearGradient
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: InkWell(
      onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/planlector.png'),
        Column(
          children: [
            Text('PLAN LECTOR',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('Desarrolla habilidades de lectura,\n comprensión y análisis, asi mismo\n cultiva el gusto por la lectura',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
    ),
  );
}
Widget ListaCursos9(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ), // EdgeInsets.symmetric
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ), // LinearGradient
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
        },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/religioncurso.png'),
        Column(
          children: [
            Text('RELIGIÓN',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('Presenta la dimensión espiritual y\n ética de la vida humana, sigue el\n camino que Dios te da.',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
    ),
  );
}
Widget ListaCursos10(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ), // EdgeInsets.symmetric
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ), // LinearGradient
      borderRadius: BorderRadius.circular(20.0),
    ), // BoxDecoration
      child: InkWell(
          onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
          },
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/tutorias.png'),
        Column(
          children: [
            Text('TUTORIA',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('Identifica tus fortalezas, abordando\n desafíos y proporciona orientación\n para tu desarrollo integral',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
      ),
  );
}
Widget ListaCursos11(BuildContext context){
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 20.0,
    ), // EdgeInsets.symmetric
    padding: const EdgeInsets.all(10.0),
    height: 130,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFAD9FE4), Colors.deepOrangeAccent],
      ), // LinearGradient
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: InkWell(
      onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => SegundaVentana()),);
      },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Image.asset('assets/iconos/correr.png'),
        Column(
          children: [
            Text('EDUCACIÓN FÍSICA',
              style:  const TextStyle(
                color: Colors.white70,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10,),
            Text('Desarrolla habilidades motoras,\n promueve la salud y el bienestar,\n y aprenden la importancia de la \nactividad física regular.',
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    ),
    ),
  );
}
