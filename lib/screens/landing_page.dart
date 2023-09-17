import 'package:c6/screens/options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 24, 10),
      body: Stack(
        children: [
          // logo/image
          Positioned(
              left: 0,
              top: 100,
              child:
                  Opacity(opacity: 0.5, child: Image.asset("images/c6.png"))),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset(
                "images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
            // child: Row(
            //   children: [
            //     Text(
            //       "C",
            //       style: GoogleFonts.montserrat(
            //         color: const Color.fromRGBO(61, 245, 135, 1),
            //         fontSize: 50,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //     Text(
            //       "6",
            //       style: GoogleFonts.montserrat(
            //         color: Colors.white,
            //         fontSize: 50,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
          ),

          // brief text
          Positioned(
            top: 300,
            left: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Discover,",
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(61, 245, 135, 1),
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Reduce,",
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(61, 245, 135, 1),
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "and",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Offset Emissions!!",
                  style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(61, 245, 135, 1),
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // login button
          const getstarted(),
        ],
      ),
    );
  }
}

class getstarted extends StatelessWidget {
  const getstarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 40,
      right: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Options()));
          },
          style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color.fromRGBO(61, 245, 135, 1)),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
            child: Text(
              "Start Today!",
              style: GoogleFonts.montserrat(
                color: const Color.fromRGBO(24, 23, 24, 10),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
