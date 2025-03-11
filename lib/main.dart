import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'controllers/review_controller.dart';
import 'models/review.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ReviewAdapter());
  await Hive.openBox<Review>("reviews");

  Get.put(ReviewController());

  runApp(ArtApp());
}

class ArtApp extends StatelessWidget {
  const ArtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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

