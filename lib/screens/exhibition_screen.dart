import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:google_fonts/google_fonts.dart';
import 'museum_screen.dart';
import '../controllers/review_controller.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';


class ExhibitionScreen extends StatelessWidget {
  final Exhibition exhibition;

  const ExhibitionScreen({super.key, required this.exhibition});

  @override
  Widget build(BuildContext context) {
    final ReviewController reviewController = Get.find<ReviewController>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController reviewControllerText = TextEditingController();
    int rating = 5;
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

                  Text(
                    "Reviews:",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Reviews
                  Obx(() {
                    final reviews = reviewController.reviews
                        .where((r) => r.exhibitionName == exhibition.name)
                        .toList();

                    if (reviews.isEmpty) {
                      return Text(
                        "No reviews yet.",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      );
                    }

                    return Column(
                      children: reviews.map((review) {
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            title: Text(
                              review.reviewerName,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(review.comment, style: GoogleFonts.playfairDisplay(fontSize: 16)),
                                Text("⭐ " * review.rating),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                  const SizedBox(height: 30),

                  // Review Form
                  Text(
                    "Add a review:",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),

                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "Your Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 100, 
                    child: TextField(
                      controller: reviewControllerText,
                      maxLines: null, 
                      expands: true, 
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        labelText: "Write a review",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 7),

                  // Rating Selector
                  Row(
                    children: [
                      Text("Rating: ", style: GoogleFonts.playfairDisplay(fontSize: 16)),
                      DropdownButton<int>(
                        value: rating,
                        items: [1, 2, 3, 4, 5].map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text("⭐ $value"),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          rating = newValue!;
                        },
                      ),
                    ],
                  ),

                  // Submit button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Color(0xFFADD8E6),
                      ),
                      onPressed: () {
                        reviewController.addReview(
                          exhibition.name,
                          nameController.text,
                          reviewControllerText.text,
                          rating,
                        );
                        nameController.clear();
                        reviewControllerText.clear();
                      },
                      child: Text("Submit Review", style: GoogleFonts.roboto(fontWeight: FontWeight.w600)),
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