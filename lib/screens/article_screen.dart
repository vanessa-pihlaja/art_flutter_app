import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleScreen extends StatelessWidget {
  final Article article; 

  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Article")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double contentWidth = screenWidth > 800 ? screenWidth * 0.5 : screenWidth * 0.9; 
          
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                Image.asset(
                  article.imageUrl[0],
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: Container(
                    width: contentWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        Text(
                          article.title,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                        // author
                        Text(
                          "By ${article.author}",
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // content
                        ..._buildContentWithSubheadings(article, contentWidth),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // content parsing widget (adds images under subtitles marked by ##)
  List<Widget> _buildContentWithSubheadings(Article article, double contentWidth) {
    List<Widget> contentWidgets = [];
    List<String> lines = article.content.split('\n'); 
    int imageIndex = 1; 

    for (int i = 0; i < lines.length; i++) {
      String line = lines[i].trim(); 

      if (line.isEmpty) continue; 

      // detect subtitles (lines that starts with ##)
      if (line.startsWith('##')) {
        contentWidgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 8),
            child: Text(
              line.replaceAll('##', '').replaceAll('*', '').trim(),
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );

        // adds image after the subtitle
        if (imageIndex < article.imageUrl.length) {
          contentWidgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(
                article.imageUrl[imageIndex],
                width: contentWidth, 
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
          );
          imageIndex++; 
        }
      } else {
        // regular text
        contentWidgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              line,
              style: GoogleFonts.roboto(fontSize: 16),
            ),
          ),
        );
      }
    }

    return contentWidgets;
  }
}
