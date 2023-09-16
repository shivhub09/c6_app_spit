import 'package:c6/screens/homescreen.dart';
import 'package:c6/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Options extends StatefulWidget {
  const Options({super.key});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 24, 10),
      body: Stack(
        children: [
          Positioned(
              left: 0,
              top: 100,
              child:
                  Opacity(opacity: 0.5, child: Image.asset("images/c6.png"))),
          Positioned(
            left: 20,
            top: 60,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Color.fromRGBO(61, 245, 135, 1),
                size: 35,
              ),
            ),
          ),

          Positioned(
            top: 115,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back.",
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Login to get Started!",
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),

          // login forms
          Positioned(
            top: 225,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: const Text("hi")),
          ),

          const loginbtn(),

          //one line
          Positioned(
              bottom: 40,
              left: 40,
              right: 40,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(24, 23, 24, 10)),
                    ),
                    Text(" Create one!",
                        style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(61, 245, 135, 1),
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class loginbtn extends StatelessWidget {
  const loginbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 70,
      left: 40,
      right: 40,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          style: const ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Color.fromRGBO(61, 245, 135, 1)),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
            child: Text(
              "Login!",
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
