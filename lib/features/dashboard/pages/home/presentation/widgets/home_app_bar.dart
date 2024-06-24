import 'package:flutter/material.dart';
import 'package:flutter_animations/core/animations/fade_in_animation.dart';
import 'package:flutter_animations/core/animations/sliding_animation.dart';
import 'package:flutter_animations/core/animations/zoom_animation.dart';
import 'package:flutter_animations/core/extensions/build_context_extension.dart';
import 'package:flutter_animations/core/widgets/app_image.dart';
import 'package:flutter_animations/gen/assets.gen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SlideAnimation(
              beginOffset: const Offset(0.2, 0.0),
              child: FadeInAnimation(
                child: Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: context.cardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppImage.svg(Assets.svgs.location, color: context.bodyLarge.color),
                      const SizedBox(width: 10.0),
                      Flexible(
                        child: Text(
                          'Lahore, Pakistan',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                    ],
                  ),
                ),
              ),
            ),
            ZoomInAnimation(
              child: AppImage.network(
                fit: BoxFit.cover,
                height: 40.0,
                width: 40.0,
                borderRadius: BorderRadius.circular(50.0),
                placeholder: (_, __) => CircleAvatar(
                  backgroundColor: context.primary.withOpacity(0.3),
                  child: AppImage.svg(Assets.svgs.person, color: context.onPrimary),
                ),
                imageUrl: 'https://lh3.googleusercontent.com/a/ACg8ocK8Fz3JefIDQ3E9qR0fIy9XX4dV0PvnVsO9UW2dzS5sX0vDSWEPSg=s288-c-no',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
