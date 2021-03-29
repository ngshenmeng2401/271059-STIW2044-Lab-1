import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int newSex = 1;
  int newWeight = 1;
  int newHeight = 1;
  int newWaist = 1;
  int value = 1;

  final TextEditingController ageTextEditingController =
      new TextEditingController();
  final TextEditingController heightTextEditingController =
      new TextEditingController();
  final TextEditingController weightTextEditingController =
      new TextEditingController();
  final TextEditingController waistTextEditingController =
      new TextEditingController();

  double absi = 0, absiz = 0;
  double waist = 0, height = 0, weight = 0, absiMean = 0, absiSD = 0;
  List<String> sexList = [];
  String age, risk = "";
  var text;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('OMNI CALCULATOR'),
        ),
        body: Center(
          child: Container(
              width: 355,
              height: 440,
              color: Colors.grey[200],
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                      height: 205,
                      width: 350,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 320,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sex",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                DropdownButton(
                                  value: newSex,
                                  items: [
                                    DropdownMenuItem(
                                      child: SizedBox(
                                        width: 55,
                                        child: Text(
                                          "Male",
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      value: 1,
                                    ),
                                    DropdownMenuItem(
                                      child: SizedBox(
                                        width: 55,
                                        child: Text(
                                          "Female",
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                      value: 2,
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      newSex = value;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 30,
                            width: 320,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 180,
                                  child: Text(
                                    "Age",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 60,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller: ageTextEditingController,
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                        //
                                        width: 60,
                                        child: Text("years",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize: 16,
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 30,
                            width: 320,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 180,
                                  child: Text(
                                    "Height",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 65,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller:
                                              heightTextEditingController,
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                        child: DropdownButton(
                                          value: newHeight,
                                          items: [
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "cm",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 1,
                                            ),
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "m",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 2,
                                            ),
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "in",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 3,
                                            ),
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "ft",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 4,
                                            ),
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "ft,in",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 5,
                                            ),
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "m,cm",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 6,
                                            ),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              newHeight = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 30,
                            width: 320,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 180,
                                  child: Text(
                                    "Weight",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 65,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller:
                                              weightTextEditingController,
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                        child: DropdownButton(
                                          value: newWeight,
                                          items: [
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "kg",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 1,
                                            ),
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "lb",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 2,
                                            ),
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "stone",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 3,
                                            ),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              newWeight = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 30,
                            width: 320,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 180,
                                  child: Text(
                                    "Waist circumtance",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 140,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 65,
                                        child: TextField(
                                          textAlign: TextAlign.center,
                                          controller:
                                              waistTextEditingController,
                                          decoration: InputDecoration.collapsed(
                                              hintText: ""),
                                          keyboardType: TextInputType.number,
                                        ),
                                      ),
                                      Container(
                                        child: DropdownButton(
                                          value: newWaist,
                                          items: [
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "cm",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 1,
                                            ),
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "m",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 2,
                                            ),
                                            DropdownMenuItem(
                                              child: SizedBox(
                                                width: 50,
                                                child: Text(
                                                  "in",
                                                  textAlign: TextAlign.right,
                                                ),
                                              ),
                                              value: 3,
                                            ),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              newWaist = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 30,
                            width: 320,
                            color: Colors.white,
                            child: RaisedButton(
                              color: Colors.grey[400],
                              child: Text(
                                "Calculate",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: calculateABSI,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 30),
                  Container(
                    height: 165,
                    width: 350,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          width: 320,
                          color: Colors.grey[350],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Result"),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 320,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                child: Text("ABSI"),
                              ),
                              Container(
                                width: 70,
                                child: Text(
                                  absi.toStringAsFixed(4),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 30,
                          width: 320,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                child: Text("ABSI z-score"),
                              ),
                              Container(
                                width: 70,
                                child: Text(
                                  absiz.toStringAsFixed(4),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          height: 60,
                          width: 320,
                          color: Colors.white,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text = new RichText(
                                  text: new TextSpan(
                                    style: new TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(
                                          text:
                                              "According to your ABSI z score,your premature\nmortality risk is "),
                                      new TextSpan(
                                          text: "" + risk + ".",
                                          style: new TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  calculateABSI() {
    setState(() {
      double weight, height, waist;

      if (newHeight == 1) {
        height = double.parse(heightTextEditingController.text) / 100;
      } else if (newHeight == 2) {
        height = double.parse(heightTextEditingController.text);
      } else if (newHeight == 3) {
        height = double.parse(heightTextEditingController.text) * 0.0254;
      } else if (newHeight == 4) {
        height = double.parse(heightTextEditingController.text) * 0.3048;
      } else if (newHeight == 5) {
        var parts = heightTextEditingController.text.split(",");
        String feet = parts[0];
        String inches = parts[1];

        height = double.parse(feet) * 0.3048 + double.parse(inches) * 0.0254;
      } else if (newHeight == 6) {
        var parts = heightTextEditingController.text.split(",");
        String m = parts[0];
        String cm = parts[1];

        height = double.parse(m) + double.parse(cm) / 100;
      }

      if (newWeight == 1) {
        weight = double.parse(weightTextEditingController.text);
      } else if (newWeight == 2) {
        weight = double.parse(weightTextEditingController.text) * 0.453592;
      } else if (newWeight == 3) {
        weight = double.parse(weightTextEditingController.text) * 6.35029;
      }

      if (newWaist == 1) {
        waist = double.parse(waistTextEditingController.text) / 100;
      } else if (newWaist == 2) {
        waist = double.parse(waistTextEditingController.text);
      } else if (newWaist == 3) {
        waist = double.parse(waistTextEditingController.text) * 0.0254;
      }

      age = ageTextEditingController.text;
      searchABSI(ageTextEditingController.text);

      double bmi = weight / (height * height);

      absi = waist / (pow(bmi, 2 / 3) * pow(height, 1 / 2));
      absiz = (absi - absiMean) / absiSD;

      if (absiz < -0.868) {
        risk = "Very Low";
      } else if (absiz >= -0.868 && absiz <= -0.272) {
        risk = "Low";
      } else if (absiz > -0.272 && absiz <= 0.229) {
        risk = "Average";
      } else if (absiz > 0.229 && absiz <= 0.789) {
        risk = "High";
      } else if (absiz > 0.789) {
        risk = "Very High";
      }
    });
  }

  searchABSI(String age) async {
    String feedbackInfo;
    int searchabsiMean, searchabsiSD;

    if (newSex == 1) {
      feedbackInfo = await rootBundle.loadString('assets/male.txt');
    } else if (newSex == 2) {
      feedbackInfo = await rootBundle.loadString('assets/female.txt');
    }

    sexList = feedbackInfo.split(" ");

    searchabsiMean = sexList.indexOf(age) + 3;
    absiMean = double.parse(sexList[searchabsiMean]);

    searchabsiSD = sexList.indexOf(age) + 4;
    absiSD = double.parse(sexList[searchabsiSD]);
  }
}
