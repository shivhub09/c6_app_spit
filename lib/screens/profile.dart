import 'package:c6/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    List<String> items = [
      "Transport",
      """home utils""",
      "Food/Cloth",
      "Restaurant"
    ];
    List<double> values = [14.2, 56.3, 22.1, 4.0];

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
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Color.fromRGBO(61, 245, 135, 1),
                    size: 35,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      child: Image.asset(
                        "images/logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "Food & Clothing",
                      style:
                          GoogleFonts.montserrat(color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: 20,
            child: Container(
              child: Text(
                "Shivam Nagori",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 20,
            child: Container(
              child: Text(
                "Your Average CarbonFootPrint",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Positioned(
            top: 210, // Adjust the top value to position the list correctly
            left: 0,
            right: 0,
            bottom:
                200, // Remove the bottom value to make it occupy the available space
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                Color textcolor = Color.fromRGBO(61, 245, 135, 1);
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  width: 225.0, // Adjust the width as needed
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black), // Add spacing between items
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          items[index].toUpperCase(),
                          style: GoogleFonts.montserrat(
                            color: textcolor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 68.0, // Adjust width as needed
                          height: 68.0, // Adjust height as needed
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                child: Text(
                                  values[index].toString(),
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(
                                  value:
                                      1.0, // This indicator is fully filled (gray background)
                                  color: Colors.grey, // Set the gray color
                                  strokeWidth: 6.0,
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                child: CircularProgressIndicator(
                                  value: (values[index] /
                                      100), // Set the progress value (0.0 to 1.0)
                                  color:
                                      textcolor, // Set the desired progress color
                                  strokeWidth:
                                      6.0, // Optional: Adjust the thickness of the indicator
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                );
              },
            ),
          ),
          Positioned(bottom: 30, left: 30, right: 30, child: gonxt())
        ],
      ),
    );
  }
}

class gonxt extends StatelessWidget {
  const gonxt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ElevatedButton(
        onPressed: () {
          // Save the cardValues into InputData and notify listeners
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LandingPage()));
        },
        style: const ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromRGBO(61, 245, 135, 1)),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Logout",
                style: GoogleFonts.montserrat(
                  color: const Color.fromRGBO(24, 23, 24, 10),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
                size: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
