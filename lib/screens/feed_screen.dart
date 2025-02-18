import 'package:flutter/material.dart';
import '../models/models.dart';
import '../models/data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'article_screen.dart';
import 'exhibition_screen.dart';
import 'museum_screen.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Museum> museums = getMuseumsAndExhibitions();
    final List<Exhibition> exhibitions = museums.expand((museum) => museum.exhibitions).toList();

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
              height:MediaQuery.of(context).size.height * 0.55,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: exhibitions.length,
                itemBuilder: (context, index) {
                  return ExhibitionCard(exhibition: exhibitions[index]);
                },
              ),
            ),

            Container(
              color: Color(0xFFADD8E6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 30, right: 20, bottom: 10),
                    child: Text(
                      "Museums: ",
                      style: GoogleFonts.playfairDisplay(
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                    ),
                  ),

                  SizedBox(
                    height:MediaQuery.of(context).size.height * 0.55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: museums.length,
                      itemBuilder: (context, index) {
                        return MuseumCard(museum: museums[index]);
                      },
                    ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleScreen(article: article),
                            ),
                          );
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



class ExhibitionCard extends StatelessWidget {
  final Exhibition exhibition;

  const ExhibitionCard({super.key, required this.exhibition});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;
    final cardHeight = screenHeight * 0.35;

    void _openExhibitionScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ExhibitionScreen(exhibition: exhibition),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: _openExhibitionScreen,
          child: Container(
          width: cardHeight,
          height: cardHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  exhibition.imageUrl,
                  width: screenWidht,
                  height: cardHeight,
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
                          exhibition.museum.name, 
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          exhibition.dates, 
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 13,
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
      ),
    );
  }
}




class MuseumCard extends StatelessWidget {
  final Museum museum;

  const MuseumCard({super.key, required this.museum});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;
    final cardHeight = screenHeight * 0.35;

    void _openMuseumScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MuseumScreen(museum: museum),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: GestureDetector(
        onTap: _openMuseumScreen,
        child: Container(
          width: cardHeight,
          height: cardHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  museum.imageUrl,
                  width: screenWidht,
                  height: cardHeight,
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
                      museum.name, 
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      museum.address,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      museum.city,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

