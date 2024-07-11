import 'package:flutter/material.dart';

class SlideUpPage extends StatefulWidget {
  const SlideUpPage({super.key});

  @override
  State<SlideUpPage> createState() => _SlideUpPageState();
}

class _SlideUpPageState extends State<SlideUpPage> {
  final ScrollController _controller = ScrollController();

  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset > 10.0) {
        setState(() {
          _isScrolled = true;
        });
      } else {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverAppBar(
              expandedHeight: size.height - 64,
              collapsedHeight: 250.0,
              floating: false,
              pinned: true,
              flexibleSpace: Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Positioned.fill(
                    child: Image.network(
                      "https://t4.ftcdn.net/jpg/06/10/26/15/360_F_610261529_vk9kf4ooTP5eSsQdOEyB4miRHn1YWCD1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: size.height - 64,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      width: size.width,
                      height: 64,
                      color: _isScrolled ? Colors.transparent : Colors.white,
                      alignment: Alignment.center,
                      child: _isScrolled ? null : const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Scroll up', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                          SizedBox(width: 12.0),
                          Icon(Icons.arrow_upward_rounded)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // add sliver grid with two tile in a row and color should be dynamic
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  margin: const EdgeInsets.all(8.0),
                  color: index.isEven ? Colors.red : Colors.blue,
                ),
                childCount: 50,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
