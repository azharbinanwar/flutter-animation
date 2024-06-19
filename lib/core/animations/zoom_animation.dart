import 'package:flutter/material.dart';

class ZoomInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration playAfter;
  final Curve curve;

  const ZoomInAnimation({
    super.key,
    required this.child,
    this.curve = Curves.easeInOut,
    this.playAfter = Duration.zero,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<ZoomInAnimation> createState() => _ZoomInAnimationState();
}

class _ZoomInAnimationState extends State<ZoomInAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );

    // Start the animation after a delay of 1 second
    Future.delayed(widget.playAfter, () {
      if (mounted) {
        _controller.forward();
      }
    });
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
      child: widget.child,
    );
  }
}
