import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'museum_screen.dart';

class ExhibitionScreen extends StatelessWidget {
  final Exhibition exhibition;

  const ExhibitionScreen({super.key, required this.exhibition});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    void _openMuseumScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MuseumScreen(museum: exhibition.museum),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(exhibition.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            //image
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                  exhibition.imageUrl,
                  width: screenHeight * 0.6,
                  height: screenHeight * 0.6,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // details
            Container(
              width: screenHeight * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exhibition.name,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    exhibition.museum.name,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )
                  ),
                  Text(
                    exhibition.dates,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    exhibition.info,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),
            
                  Text(
                    "Where you'll find this",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),

                  GestureDetector(
                    onTap: _openMuseumScreen,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              exhibition.museum.imageUrl,
                              width: screenHeight,
                              height: screenHeight * 0.25,
                              fit: BoxFit.cover,
                            ),
                          )
                          ),
                        ),
                        Text(
                          exhibition.museum.name,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )
                        ),
                        Text(
                          "${exhibition.museum.address}, ${exhibition.museum.city}",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}