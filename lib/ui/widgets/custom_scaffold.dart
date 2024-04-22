import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isGifPlaying = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        setState(() {
          _isGifPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: _isGifPlaying
                ? Image.asset(
              'assets/images/Bienvenida.gif',
              key: Key('gif'), // clave única para AnimatedSwitcher
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            )
                : Image.asset(
              'assets/images/Bienvenida.jpg', // Reemplaza con la ruta correcta de tu imagen
              key: Key('image'), // clave única para AnimatedSwitcher
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          SafeArea(
            child: widget.child!,
          ),
        ],
      ),
    );
  }
}
