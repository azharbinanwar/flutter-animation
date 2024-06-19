import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animations/core/animations/fade_in_animation.dart';
import 'package:flutter_animations/core/animations/size_animateoin.dart';
import 'package:flutter_animations/core/extensions/build_context_extension.dart';
import 'package:flutter_animations/core/extensions/widget_extension.dart';
import 'package:flutter_animations/core/widgets/app_image.dart';

class ImageViewer extends StatelessWidget {
  final String path;
  final String address;

  const ImageViewer({
    super.key,
    required this.path,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: AppImage.asset(
            path,
            borderRadius: BorderRadius.circular(12.0),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 10.0,
          right: 10.0,
          bottom: 10.0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                child: SizeAnimation(
                  maxHeight: 50.0,
                  minHeight: 50.0,
                  minWidth: 50.0,
                  maxWidth: context.width,
                  duration: const Duration(seconds: 2),
                  playAfter: const Duration(milliseconds: 3000),
                  child: Stack(
                    children: [
                      Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: FadeInAnimation(
                          playAfter: const Duration(seconds: 4),
                          child: Text(address, style: context.titleMedium.copyWith(fontWeight: FontWeight.bold)).center().paddingOnly(right: 25.0),
                        ),
                      ),
                      Positioned(
                        right: 0.0,
                        child: Container(
                          height: 48.0,
                          width: 48.0,
                          margin: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
