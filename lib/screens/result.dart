import 'dart:convert';

import 'package:c6/screens/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Result extends StatefulWidget {
  final List<int> transportation;
  final List<int> food;
  final List<int> homeutils;
  final List<int> restaurant;
  final int index;
  Result(
      {required this.food,
      required this.homeutils,
      required this.restaurant,
      required this.transportation,
      required this.index});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  List<dynamic> carbonData = [];
  late Future<void> fetchDataFuture;
  @override
  void initState() {
    super.initState();
    fetchDataFuture = fetchdata();
  }

  bool _isLoading = true;
  Future<void> fetchdata() async {
    const String url =
        "https://74xxrc6bkblhweowdhb53cjdjq0cnlzf.lambda-url.us-west-1.on.aws/";

    final List<Map<String, dynamic>> data2Send = [
      {
        "unit": widget.index,
      },
      {
        "name": "NATURALGAS",
        "value": widget.homeutils[1],
      },
      {
        "name": "ELECTRICITY",
        "value": widget.homeutils[0],
      },
      {
        "name": "WATER",
        "value": widget.homeutils[2],
      },
      {
        "name": "CAR",
        "value": widget.transportation[0],
      },
      {
        "name": "BUS",
        "value": widget.transportation[1],
      },
      {
        "name": "SUBWAY",
        "value": widget.transportation[2],
      },
      {
        "name": "RAIL",
        "value": widget.transportation[4],
      },
      {
        "name": "AIRPLANE",
        "value": widget.transportation[3],
      },
      {
        "name": "HOTEL",
        "value": widget.restaurant[1],
      },
      {
        "name": "RESTAURANT",
        "value": widget.restaurant[0],
      },
      {
        "name": "FOOD",
        "value": widget.food[4],
      },
      {
        "name": "CLOTHING",
        "value": widget.food[5],
      },
      {
        "name": "DAIRY",
        "value": widget.food[0],
      },
      {
        "name": "MEAT",
        "value": widget.food[1],
      },
      {
        "name": "FRUIT&VEG",
        "value": widget.food[2],
      },
      {
        "name": "WINE",
        "value": widget.food[3],
      },
    ];

    print(data2Send);
    try {
      final response = await http
          .post(Uri.parse(url), body: jsonEncode(data2Send), headers: {
        "Content-Type": "application/json",
      });

      if (response.statusCode == 200) {
        final dynamic res = jsonDecode(response.body);
        final stats = res[1];
        final values = res[0];

        setState(() {
          carbonData = res;
          _isLoading = false; // Data is loaded, set _isLoading to false
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      print(e.toString());
      setState(() {
        _isLoading = false; // Error occurred, set _isLoading to false
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "CONSUMER_GOODS",
      "UTILITIES",
      "ACCOMMODATION",
      "TRANS"
    ];
    List<String> imp = [
      """CONSUMER 
      GOODS""",
      "UTILITIES",
      "ACCOMMODE",
      "TRANSPORT"
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 23, 24, 10),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 40, 20, 10),
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
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Carbon FootPrints :",
                style: GoogleFonts.montserrat(
                  color: Color.fromRGBO(61, 245, 135, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: fetchDataFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    // Handle error
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 10.0,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final String summ =
                              carbonData[1][titles[index]]["stats"];
                          return Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(61, 245, 135, 1),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    imp[index],
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  Center(
                                    child: Text(
                                      summ.substring(0, 5),
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ));
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
