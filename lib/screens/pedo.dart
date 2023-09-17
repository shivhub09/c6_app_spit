import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedometer/pedometer.dart';

class PedometerApp extends StatefulWidget {
  @override
  _PedometerAppState createState() => _PedometerAppState();
}

class _PedometerAppState extends State<PedometerApp> {
  int _steps = 0;
  String _pedestrianStatus = 'Unknown';
  bool _isCounting = false;

  void startCountingAfterDelay() {
    Timer(Duration(seconds: 30), () {
      setState(() {
        _isCounting = true;
      });
    });
  }

  void increaseSteps() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_isCounting) {
        setState(() {
          // Increase the step count by 4 every 3 seconds
          _steps += 4;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startCountingAfterDelay();
    increaseSteps();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(24, 23, 24, 10),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              top: 100,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset("images/c6.png"),
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Row(
                children: [
                  Text(
                    "C",
                    style: GoogleFonts.montserrat(
                      color: const Color.fromRGBO(61, 245, 135, 1),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "6",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 75,
              top: 300,
              child: Text(
                "Your Step Count : ",
                style: GoogleFonts.montserrat(
                  color: Color.fromRGBO(61, 245, 135, 1),
                  fontSize: 25,
                ),
              ),
            ),
            Positioned(
              top: 375,
              left: 175,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isCounting = !_isCounting;
                  });
                },
                child: Text(
                  _steps.toString(),
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
