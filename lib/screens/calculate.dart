import 'package:c6/models.dart/model.dart';
import 'package:c6/screens/transportation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:c6/services/provider_clas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  Set<int> selectedCardIndices = {};
  int selectedPeriodIndex = -1;

  @override
  Widget build(BuildContext context) {
    List<String> period = ["Day", "Week", "Month"];
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 24, 10),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 100,
            child: Opacity(opacity: 0.5, child: Image.asset("images/c6.png")),
          ),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                Text(
                  "Time Period",
                  style: GoogleFonts.montserrat(color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: 125,
            right: 20,
            child: Text(
              "Select the time period you would like to calculate your carbon footprint for :",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 250,
            child: SizedBox(
              height: 400,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: period.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedCardIndices.contains(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPeriodIndex =
                            index; // Removed the extra setState
                      });
                    },
                    child: Card(
                      color: isSelected
                          ? Color.fromRGBO(61, 245, 135, 1)
                          : Colors.white,
                      child: Center(
                        child: Text(
                          period[index],
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: gonxt(
              selectedPeriodIndex: selectedPeriodIndex,
              onTap: () {
                if (selectedPeriodIndex != -1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Transportation(index: selectedPeriodIndex,)),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class gonxt extends StatelessWidget {
  final int selectedPeriodIndex;
  final VoidCallback onTap;

  const gonxt(
      {required this.selectedPeriodIndex, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> period = ["Day", "Week", "Month"];
    String selectedPeriod = selectedPeriodIndex != -1
        ? period[selectedPeriodIndex]
        : "Select a period";

    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ElevatedButton(
        onPressed: onTap,
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
                "Transportation - $selectedPeriod",
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
