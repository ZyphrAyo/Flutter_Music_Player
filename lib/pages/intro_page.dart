import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_rolls/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.network(
            'https://i.postimg.cc/m2mmNr0Y/wallp.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Black background for text section
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3), // Adjust opacity as needed
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 10),
                  // Shop name and icon in a Row
                  Row(
                    children: [
                      // Shop name
                      Text(
                        "SUSHI ROLLS",
                        style: GoogleFonts.lora(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10), // Adjust the spacing as needed
                      // Icon
                    ],
                  ),
                  const SizedBox(height: 335),
                  const SizedBox(height: 28),
                  // Title
                  Text(
                    "THE REAL JAPANESE TASTE",
                    style: GoogleFonts.libreBaskerville(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),
                  // Subtitle
                  Text(
                    "Feel the taste of the most authentic Japanese food, just a click away",
                    style: GoogleFonts.ptSerif(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[350],
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),
                  // Get Started Button
                  MyButton(
                    text: "Get Started",
                    onTap: () {
                      Navigator.pushNamed(context, '/menupage');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
