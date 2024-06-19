import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension BuildContextEntension<T> on BuildContext {
  Size get size => MediaQuery.of(this).size;

  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  bool get isTablet => MediaQuery.of(this).size.width < 1024.0 && MediaQuery.of(this).size.width >= 650.0;

  bool get isSmallTablet => MediaQuery.of(this).size.width < 650.0 && MediaQuery.of(this).size.width > 500.0;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall => MediaQuery.of(this).size.width < 850.0 && MediaQuery.of(this).size.width >= 560.0;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get paddingTop => MediaQuery.of(this).padding.top;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  int responsiveBreakpoint([double width = 400]) => max(size.width ~/ width, 1);

  // text styles

  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;

  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;

  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;

  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;

  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;

  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get titleTextStyle => Theme.of(this).appBarTheme.titleTextStyle!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get bodyMedium => GoogleFonts.montserrat(
        textStyle: Theme.of(this).textTheme.bodyMedium!,
      );

  TextStyle get dividerTextSmall => bodySmall.copyWith(letterSpacing: 0.5, fontWeight: FontWeight.w700, fontSize: 12.0);

  TextStyle get dividerTextLarge => bodySmall.copyWith(letterSpacing: 1.5, fontWeight: FontWeight.w700, fontSize: 13.0, height: 1.23);

  // colors

  ThemeData get theme => Theme.of(this);

  IconThemeData get iconTheme => Theme.of(this).iconTheme;

  Brightness get brightness => Theme.of(this).brightness;

  ColorScheme get seedColor => Theme.of(this).colorScheme;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;

  Color get onPrimaryContainer => Theme.of(this).colorScheme.onPrimaryContainer;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  Color get onSecondaryContainer => Theme.of(this).colorScheme.onSecondaryContainer;

  Color get surface => Theme.of(this).colorScheme.surface;

  Color get onSurface => Theme.of(this).colorScheme.onSurface;

  Color get error => Theme.of(this).colorScheme.error;

  Color get onError => Theme.of(this).colorScheme.onError;

  Color get errorContainer => Theme.of(this).colorScheme.errorContainer;

  Color get onErrorContainer => Theme.of(this).colorScheme.onErrorContainer;

  Color get shadow => Theme.of(this).colorScheme.shadow;

  Color get background => Theme.of(this).colorScheme.background;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get cardColor => Theme.of(this).cardColor;

  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  Color get appBarColor => Theme.of(this).appBarTheme.backgroundColor!;

  Color get iconColor => Theme.of(this).iconTheme.color!;

  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  Orientation get orientation => MediaQuery.of(this).orientation;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(String message) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        // backgroundColor: primary,
      ),
    );
  }

  void unfocus() => FocusScope.of(this).unfocus();
}
