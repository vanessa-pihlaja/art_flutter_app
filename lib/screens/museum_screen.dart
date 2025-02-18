import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exhibition_screen.dart';

class MuseumScreen extends StatelessWidget {
  final Museum museum;

  const MuseumScreen({super.key, required this.museum});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(museum.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // image
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    museum.imageUrl,
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
                    museum.name,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${museum.address}, ${museum.city}",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                      "Current exhibitions:",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                ],
              ),
            ),

            Container(
              width: screenHeight * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // exhibitions
                  if (museum.exhibitions.isNotEmpty) ...[

                    SizedBox(
                      height: screenHeight * 0.5, 
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: museum.exhibitions.length,
                        itemBuilder: (context, index) {
                          final exhibition = museum.exhibitions[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExhibitionScreen(exhibition: exhibition),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      exhibition.imageUrl,
                                      width: screenHeight * 0.3,
                                      height: screenHeight * 0.3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  Text(
                                    exhibition.name,
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    exhibition.dates,
                                    style: GoogleFonts.playfairDisplay(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ] else ...[
                    Text(
                      "No current exhibitions available.",
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
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
