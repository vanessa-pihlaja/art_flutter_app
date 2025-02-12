import 'package:flutter/material.dart';
import '../models/models.dart';
import '../models/data.dart';
import 'package:google_fonts/google_fonts.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ArticleCard(article: index == 0 ? article_1 : article_2);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16, top: 50, right: 20, bottom: 10),
              child: Text(
                "Exhibitions: ",
                style: GoogleFonts.playfairDisplay(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
              ),
            ),

            SizedBox(
              height:MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return ExhibitionCard(exhibition: exhibitions[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Container(
        width: screenWidht,
        height: screenHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: [
            // image
            ClipRRect(
              child: Image.asset(
                article.imageUrl[0],
                width: screenWidht,
                height: screenHeight,
                fit: BoxFit.cover,
              ),
            ),

            // gradient over the image
            Container(
              width: double.infinity,
              height: screenHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6), 
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
            ),

            // content
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  Text(
                    article.title,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // author
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "By ${article.author}",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          color: Colors.white70, 
                        ),
                      ),
                      const SizedBox(height: 12),

                      // read more -button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0), 
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // navigate to the article
                        },
                        child: const Text("Read more →"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Exhibition> exhibitions = [
    exhibition_1,
    exhibition_2,
    exhibition_3,
    exhibition_4,
  ];

class ExhibitionCard extends StatelessWidget {
  final Exhibition exhibition;

  const ExhibitionCard({super.key, required this.exhibition});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;
    final cardHeigth = screenHeight * 0.35;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        width: cardHeigth,
        height: cardHeigth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                exhibition.imageUrl,
                width: screenWidht,
                height: cardHeigth,
                fit: BoxFit.cover,
              ),
            ),

            // exhibition details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exhibition.name, 
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        exhibition.place, 
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}