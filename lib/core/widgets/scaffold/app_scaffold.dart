import 'package:flutter/material.dart';
import 'package:flutter_animations/core/extensions/build_context_extension.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? drawer;
  final Key? scaffoldKey;
  final PreferredSizeWidget? appBar;

  const AppScaffold({
    super.key,
    this.drawer,
    this.appBar,
    this.body,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: ColoredBox(color: Colors.white)),
        const Positioned(child: _BackgroundHome()),
        Positioned.fill(
          child: Scaffold(
            key: scaffoldKey,
            drawer: drawer,
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: body,
          ),
        ),
      ],
    );
  }
}

class _BackgroundHome extends StatelessWidget {
  const _BackgroundHome();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.scaffoldBackgroundColor,
            context.scaffoldBackgroundColor,
            context.primary.withOpacity(0.02),
            context.primary.withOpacity(0.05),
            context.primary.withOpacity(0.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
