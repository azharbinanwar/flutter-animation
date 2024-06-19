import 'package:flutter/material.dart';
import 'package:flutter_animations/core/animations/fade_in_animation.dart';
import 'package:flutter_animations/core/animations/incremental_animation.dart';
import 'package:flutter_animations/core/animations/sliding_animation.dart';
import 'package:flutter_animations/core/constants/app_strings.dart';
import 'package:flutter_animations/core/extensions/build_context_extension.dart';
import 'package:flutter_animations/core/extensions/widget_extension.dart';

class BuyAndRentItem extends StatelessWidget {
  final int buyValue;
  final int rentValue;

  const BuyAndRentItem({
    super.key,
    this.buyValue = 1032,
    this.rentValue = 1920,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInAnimation(
            duration: const Duration(seconds: 1),
            child: SlideAnimation(
              beginOffset: const Offset(-1.0, 0.0),
              child: Container(
                height: context.width * 0.42,
                width: context.width * 0.42,
                decoration: BoxDecoration(color: context.primary, borderRadius: BorderRadius.circular(context.width * .5)),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.buy, style: context.bodyMedium.copyWith(color: context.titleMedium.color)),
                    IncrementalAnimation(
                      value: buyValue,
                      style: context.headlineLarge.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 42.0,
                      ),
                    ),
                    Text(AppStrings.offers, style: context.bodyMedium.copyWith(color: context.titleMedium.color)),
                  ],
                ),
              ).center(),
            ),
          ),
          const SizedBox(width: 16.0),
          FadeInAnimation(
            duration: const Duration(seconds: 1),
            child: SlideAnimation(
              beginOffset: const Offset(1.0, 0.0),
              child: Container(
                height: context.width * 0.42,
                width: context.width * 0.42,
                decoration: BoxDecoration(
                  color: context.cardColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.rent, style: context.bodySmall),
                    IncrementalAnimation(
                      value: rentValue,
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 42.0,
                      ),
                    ),
                    Text(AppStrings.offers, style: context.bodyMedium),
                  ],
                ),
              ).center(),
            ),
          ),
        ],
      ),
    );
  }
}
