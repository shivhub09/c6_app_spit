import 'package:c6/models.dart/model.dart';
import 'package:c6/screens/homescreen.dart';
import 'package:c6/screens/result.dart';
import 'package:c6/services/provider_clas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class restaurant extends StatefulWidget {
  final List<int> transportationlist;
  final List<int> homeutils;
  final int index;
  final List<int> food;
  const restaurant(
      {required this.food,
      required this.homeutils,
      required this.index,
      required this.transportationlist});

  @override
  State<restaurant> createState() => _restaurantState();
}

class _restaurantState extends State<restaurant> {
  List<String> restaurant = [
    "Restaurant",
    "Hotel",
  ];
  List<int> arraynumbers = [0, 0];
  Set<int> selectedCardIndices = {};

  @override
  Widget build(BuildContext context) {
    List<int> cardValues = List<int>.filled(restaurant.length, 0);

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
                  "Restaurant & Accommodation",
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
              "Restaurant & Accommodation",
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
            top: 165,
            child: SizedBox(
              height: 600,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: restaurant.length,
                itemBuilder: (context, index) {
                  // Build each grid item
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
                    child: Column(
                      children: [
                        Container(
                          height: 75,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Color.fromRGBO(61, 245, 135, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              restaurant[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50.0,
                          width: 250.0,
                          child: TextField(
                             style: TextStyle(
    color: Colors.white, // Change this to the desired text color
  ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              arraynumbers[index] = int.tryParse(value) ?? 0;
                            },
                            decoration: InputDecoration(
                              labelText: 'In USD',
                              labelStyle:
                                  GoogleFonts.montserrat(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(61, 245, 135, 1),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(61, 245, 135, 1),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        )
                      ],
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
                homeutils: widget.homeutils,
                transportationlist: widget.transportationlist,
                food: widget.food,
                arraynumber: arraynumbers,
              ))
        ]));
  }
}

class gonxt extends StatelessWidget {
  final List<int> arraynumber;
  final List<int> homeutils;
  final List<int> transportationlist;
  final List<int> food;
  final int index;
  const gonxt(
      {required this.homeutils,
      required this.arraynumber,
      required this.index,
      required this.transportationlist,
      required this.food});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: ElevatedButton(
        onPressed: () {
          print(this.arraynumber);
          print(this.index);
          print(this.homeutils);
          print(this.transportationlist);
          print(this.food);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Result(
                        index: this.index,
                        food: this.food,
                        homeutils: this.homeutils,
                        restaurant: this.arraynumber,
                        transportation: this.transportationlist,
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
                "Submit",
                style: GoogleFonts.montserrat(
                  color: const Color.fromRGBO(24, 23, 24, 10),
                  fontSize: 16,
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
