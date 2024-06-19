import 'package:flutter/material.dart';
import 'package:flutter_animations/core/animations/fade_in_animation.dart';
import 'package:flutter_animations/core/animations/sliding_animation.dart';
import 'package:flutter_animations/features/dashboard/pages/home/presentation/pages/home_page.dart';
import 'package:flutter_animations/features/dashboard/widgets/nav_bar.dart';
import 'package:flutter_animations/gen/assets.gen.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<(String, Widget)> _navbarItems = [];

  @override
  void initState() {
    super.initState();
    _navbarItems.addAll([
      (Assets.svgs.searchFilled, const HomePage()),
      (Assets.svgs.message, const HomePage()),
      (Assets.svgs.home, const HomePage()),
      (Assets.svgs.fav, const HomePage()),
      (Assets.svgs.person, const HomePage()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IndexedStack(
          children: [
            HomePage(),
            HomePage(),
          ],
        ),
        Positioned(
          bottom: 20.0,
          right: 0.0,
          left: 0.0,
          child: SlideAnimation(
            playAfter: const Duration(seconds: 5),
            beginOffset: const Offset(0.0, 1.0),
            duration: const Duration(milliseconds: 1000),
            child: FadeInAnimation(
              playAfter: const Duration(seconds: 5),
              duration: const Duration(milliseconds: 1000),
              child: Navbar(items: _navbarItems),
            ),
          ),
        )
      ],
    );
  }
}
