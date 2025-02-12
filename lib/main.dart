import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(ArtApp());
}

class ArtApp extends StatelessWidget {
  const ArtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art app',
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500), 
          displayMedium: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500), 
          displaySmall: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500), 
          headlineMedium: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500), 
          headlineSmall: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500), 
          titleLarge: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500), 
          bodyLarge: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500), 
          bodyMedium: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500), 
          bodySmall: GoogleFonts.playfairDisplay(fontWeight: FontWeight.w500), 
        ),
        useMaterial3: true
      ),
      home: const MainScreen(),
    );
  }
}