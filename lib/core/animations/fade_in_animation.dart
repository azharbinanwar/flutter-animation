import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration playAfter;

  const FadeInAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.playAfter = Duration.zero,
  });

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    Future.delayed(widget.playAfter, () {
      if (mounted) {
        _controller.forward();
        setState(() {});
      }
    });
  }

  @override
  void didUpdateWidget(covariant FadeInAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update animation duration if it has changed
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
      _controller.forward(from: 0); // Restart the animation with the new duration
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateDuration(Duration newDuration) {
    _controller.duration = newDuration;
    _controller.forward(from: 0); // Restart the animation with the new duration
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
