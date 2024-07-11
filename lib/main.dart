import 'package:flutter/material.dart';
import 'package:flutter_animations/features/dashboard/pages/slider_up/slider_up_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animations/features/dashboard/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xffFC9e12),
        fontFamily: GoogleFonts.raleway().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffFC9e12),
          primary: const Color(0xffFC9e12),
          onPrimary: Colors.white,
          secondary: const Color(0xff2B2B2B),
          onSecondary: Colors.white,
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: Color(0xffAD9F8A), fontSize: 12),
          bodyMedium: TextStyle(color: Color(0xffAD9F8A), fontSize: 14),
          bodyLarge: TextStyle(color: Color(0xffAD9F8A), fontSize: 16),
        ),
        useMaterial3: false,
      ),
      home: const SlideUpPage(),
    );
  }
}
