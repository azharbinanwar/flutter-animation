import 'package:flutter/material.dart';
import 'package:flutter_animations/core/animations/fade_in_animation.dart';
import 'package:flutter_animations/core/animations/sliding_animation.dart';
import 'package:flutter_animations/core/constants/app_strings.dart';
import 'package:flutter_animations/core/extensions/build_context_extension.dart';
import 'package:flutter_animations/core/extensions/widget_extension.dart';
import 'package:flutter_animations/core/widgets/scaffold/app_scaffold.dart';
import 'package:flutter_animations/features/dashboard/pages/home/presentation/widgets/buy_and_rent_item.dart';
import 'package:flutter_animations/features/dashboard/pages/home/presentation/widgets/home_app_bar.dart';
import 'package:flutter_animations/features/dashboard/pages/home/presentation/widgets/listing_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 450.0,
            pinned: true,
            elevation: 0.0,
            title: const HomeAppBar(),
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kToolbarHeight),
                  SlideAnimation(
                    beginOffset: const Offset(0.2, 0.0),
                    child: FadeInAnimation(
                      child: Text.rich(
                        TextSpan(
                          text: 'Hi, Joseph',
                          style: context.bodyLarge.copyWith(fontSize: 24.0, fontWeight: FontWeight.normal),
                          children: [
                            const TextSpan(text: '\n'),
                            TextSpan(
                              text: AppStrings.letsSelectYourPerfectPlace,
                              style: context.headlineLarge.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ).paddingAll(16.0),
                    ),
                  ),
                  const BuyAndRentItem(),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: ListingItems()),
          const SliverToBoxAdapter(child: SizedBox(height: 72.0)),
        ],
      ).safeArea(),
    );
  }
}
