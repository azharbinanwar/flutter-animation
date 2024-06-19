import 'package:flutter/material.dart';
import 'package:flutter_animations/core/extensions/build_context_extension.dart';

class IncrementalAnimation extends StatefulWidget {
  final int value;
  final TextStyle? style;

  const IncrementalAnimation({
    super.key,
    required this.value,
    this.style,
  });

  @override
  State<IncrementalAnimation> createState() => _IncrementalAnimationState();
}

class _IncrementalAnimationState extends State<IncrementalAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = IntTween(begin: 0, end: widget.value).animate(_controller)..addListener(() => setState(() {}));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        '${_animation.value}',
        style: widget.style ?? context.headlineLarge.copyWith(fontWeight: FontWeight.w900, fontSize: 42.0),
      ),
    );
  }
}
