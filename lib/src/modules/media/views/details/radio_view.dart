import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Radio',
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: 'Listen to Online '),
                    TextSpan(
                      text: 'Live',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const TextSpan(text: ' Radio'),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              _buildPlayerCircle(),
              // const SizedBox(height: 48),
              // Text(
              //   'Efatha Radio',
              //   style: GoogleFonts.outfit(
              //     fontSize: 22,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.blue.shade800,
              //   ),
              // ),
              // const SizedBox(height: 8),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Icon(Icons.volume_up, color: Colors.grey),
              //     SizedBox(width: 8),
              //     Icon(Icons.stop_circle, color: Colors.red, size: 32),
              //   ],
              // ),
              // const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerCircle() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF04A3DA), Color(0xFF025774)],
          stops: [0.2834, 0.6162],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset("assets/radio.png", height: 100),

            RichText(
              text: TextSpan(
                style: GoogleFonts.outfit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(
                    text: 'Efatha Radio ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '●',
                    style: GoogleFonts.outfit(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                Container(
                  padding: .all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow, color: Colors.black),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.volume_up, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
