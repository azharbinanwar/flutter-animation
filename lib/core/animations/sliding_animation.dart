import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset beginOffset;
  final Offset endOffset;
  final Duration playAfter;

  const SlideAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.playAfter = Duration.zero,
    this.beginOffset = Offset.zero,
    this.endOffset = Offset.zero,
  });

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: widget.beginOffset, // Start position
      end: widget.endOffset, // End position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation with a delay
    Future.delayed(widget.playAfter, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
