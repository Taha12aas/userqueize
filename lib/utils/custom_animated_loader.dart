import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomAnimatedLoader extends StatefulWidget {
  const CustomAnimatedLoader({super.key, required this.color});
final Color color;
  @override
  State<CustomAnimatedLoader> createState() => _CustomAnimatedLoaderState();
}

class _CustomAnimatedLoaderState extends State<CustomAnimatedLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0.8, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _animation,
        child:  SpinKitWave(
          color: widget.color,
          size: 50.0,
        ));
  }
}
