import 'package:c6/screens/calculate.dart';
import 'package:c6/screens/chatbot.dart';
import 'package:c6/screens/pedo.dart';
import 'package:c6/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedometer/pedometer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "Transportation",
      "home utilities",
      "Food & Clothing",
      "Restaurant & Accommodation"
    ];

    List<String> itemsdesc = [
      "Transportation : Contributor to carbon footprint due to fossil fuel usage.",
      "Home utilities: Energy consumption impacts carbon footprint, reduce through efficiency.",
      "Food and clothing: Production and transportation contribute to carbon emissions.",
      "Restaurant & accommodation: Dining out and lodging generate carbon through services."
    ];
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => ChatScreen()));
      //   },
      //   child: Icon(
      //     Icons.chat_bubble_outlined,
      //     color: Colors.black,
      //   ), // You can use any Icon you like
      //   backgroundColor: Color.fromRGBO(61, 245, 135, 1),
      // ),
      backgroundColor: const Color.fromRGBO(24, 23, 24, 10),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
              left: 0,
              top: 100,
              child:
                  Opacity(opacity: 0.5, child: Image.asset("images/c6.png"))),
          // profile icon and side bar
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromRGBO(61, 245, 135, 1),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // drawer
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hello,",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 25),
                    ),
                    Text(
                      " Shivam!!",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    )
                  ],
                )
              ],
            ),
          ),

          Positioned(
            top: 175, // Adjust the top value to position the list correctly
            left: 0,
            right: 0,
            bottom:
                425, // Remove the bottom value to make it occupy the available space
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                Color textcolor = index % 2 != 0
                    ? Color.fromRGBO(61, 245, 135, 1)
                    : Colors.black;
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: 225.0, // Adjust the width as needed
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: index % 2 == 0
                        ? Color.fromRGBO(61, 245, 135, 1)
                        : Colors.black,
                  ), // Add spacing between items
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index].toUpperCase(),
                          style: GoogleFonts.montserrat(
                            color: textcolor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Flexible(
                            child: Text(
                          itemsdesc[index],
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ))
                      ]),
                );
              },
            ),
          ),

          // button to calculate your carbon footprint

          Positioned(
              top: 500,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Calculate your",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Carbon FootPrint",
                        style: GoogleFonts.montserrat(
                          color: Color.fromRGBO(61, 245, 135, 1),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Now!!",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  calcbtn(),
                ],
              )),

          Positioned(
              top: 580,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Start your",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Foot Count ",
                        style: GoogleFonts.montserrat(
                          color: Color.fromRGBO(61, 245, 135, 1),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Now!!",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  calcwalk(),
                ],
              )),

          // bottom part
          Positioned(
              bottom: 0,
              top: 700,
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
                  child: const Center(
                    child: Text("You can see your badges here"),
                  )))
        ],
      ),
    );
  }
}

class calcbtn extends StatelessWidget {
  const calcbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Calculate()));
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 22, 0, 22),
          child: Text(
            "Calculate Now!",
            style: GoogleFonts.montserrat(
              color: const Color.fromRGBO(24, 23, 24, 10),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class calcwalk extends StatelessWidget {
  const calcwalk({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PedometerApp()));
        },
        style: const ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromRGBO(61, 245, 135, 1)),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 22, 0, 22),
          child: Text(
            "Start Walking!",
            style: GoogleFonts.montserrat(
              color: const Color.fromRGBO(24, 23, 24, 10),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
