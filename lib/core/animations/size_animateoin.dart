import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  final Widget child;
  final double? minHeight;
  final double? maxHeight;
  final double? minWidth;
  final double? maxWidth;
  final Duration duration;
  final Curve curve;
  final Duration playAfter;

  const SizeAnimation({
    super.key,
    required this.child,
    this.minHeight,
    this.maxHeight,
    this.minWidth,
    this.maxWidth,
    this.duration = const Duration(seconds: 2),
    this.curve = Curves.easeInOut,
    this.playAfter = Duration.zero,
  });

  @override
  State<SizeAnimation> createState() => _SizeAnimationState();
}

class _SizeAnimationState extends State<SizeAnimation> with SingleTickerProviderStateMixin {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(widget.playAfter, () {
      if (mounted) {
        _isPlaying = true;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      curve: widget.curve,
      width: _isPlaying ? widget.maxWidth : widget.minWidth,
      height: _isPlaying ? widget.maxHeight : widget.minHeight,
      child: widget.child,
    );
  }
}
