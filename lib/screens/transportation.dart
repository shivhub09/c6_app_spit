import 'dart:ffi';

import 'package:c6/models.dart/model.dart';
import 'package:c6/screens/homeuttilities.dart';
import 'package:c6/services/provider_clas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Transportation extends StatefulWidget {
  final int index;

  const Transportation({required this.index, super.key});

  @override
  State<Transportation> createState() => _TransportationState();
}

class _TransportationState extends State<Transportation> {
  Set<int> selectedCardIndices = {};
  List<int> transportationvalues = [0, 0, 0, 0, 0];
  final transportationlist = ["Car", "Bus", "Subway", "Airplane", "Train"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputDataProvider = Provider.of<InputDataProvider>(context);

    return Scaffold(
        backgroundColor: const Color.fromRGBO(24, 23, 24, 10),
        body: Stack(children: [
          Positioned(
              left: 0,
              top: 100,
              child:
                  Opacity(opacity: 0.5, child: Image.asset("images/c6.png"))),
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
                  "Transportation",
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
              "Transportation : ",
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
            top: 140,
            child: SizedBox(
              height: 600,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: transportationlist.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedCardIndices.contains(index);

                  // Build each grid item
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedCardIndices.remove(index);
                        } else {
                          selectedCardIndices.add(index);
                        }
                      });
                    },
                    child: Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 75,
                            // Adjust the height as needed (for example, 100)
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color.fromRGBO(61, 245, 135,
                                      1) // Change the color for selected card
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20.0),
                              border:
                                  Border.all(color: Colors.black, width: 1.0),
                            ),
                            child: Center(
                              child: Text(
                                transportationlist[index],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: !isSelected
                                      ? Colors.black
                                      // Change the color for selected card
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  10), // Add spacing between the card and input field
                          // Input field for numbers
                          Container(
                            height: 50.0, // Adjust the height as needed
                            width: 250.0, // Adjust the width as needed
                            child: TextField(
                              style: TextStyle(
                                color: Colors
                                    .white, // Change this to the desired text color
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                // Update the value for the current card
                                transportationvalues[index] =
                                    int.tryParse(value) ?? 0;
                              },
                              decoration: InputDecoration(
                                labelText: 'In Miles',
                                labelStyle:
                                    GoogleFonts.montserrat(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(61, 245, 135,
                                          1), // Border color when not selected
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color.fromRGBO(61, 245, 135,
                                          1), // Border color when not selected
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                          )
                        ],
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
                index: widget.index,
                arraynumbers: transportationvalues,
              ))
        ]));
  }
}

class gonxt extends StatelessWidget {
  final List<int> arraynumbers;
  final int index;
  const gonxt({
    required this.arraynumbers,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ElevatedButton(
        onPressed: () {
          // Save the cardValues into InputData and notify listeners
          print(arraynumbers);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeUtils(
                        index: this.index,
                        transportationlist: this.arraynumbers,
                      )));
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
                "Home Utilities",
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
