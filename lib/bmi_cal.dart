import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'data_container.dart';
import 'container_box.dart';

const activecolor = Colors.blue;
const inactivecolor = Color(0xFFffffff);

class BMI extends StatefulWidget {
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {

  final textstyle1 = TextStyle(fontSize: 18.0, color: Color(0xFF000000));
  final textstyle2 = TextStyle(
      fontSize: 40.0, color: Color(0xFF000000), fontWeight: FontWeight.bold);
  Color maleboxcolor = activecolor;
  Color femaleboxcolor = inactivecolor;
  int height = 180;
  int Weight = 20;
  int age = 25;

  void boxupdate(int gender) {
    if (gender == 1) {
      if (maleboxcolor == inactivecolor) {
        maleboxcolor = activecolor;
        femaleboxcolor = inactivecolor;
      } else {
        maleboxcolor = inactivecolor;
        femaleboxcolor = activecolor;
      }
    } else {
      if (femaleboxcolor == inactivecolor) {
        femaleboxcolor = activecolor;
        maleboxcolor = inactivecolor;
      } else {
        femaleboxcolor = inactivecolor;
        maleboxcolor = activecolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  boxupdate(1);
                                });
                              },
                              child: containerbox(
                                boxcolor: maleboxcolor,
                                childwidget: DataContainer(
                                    icon: FontAwesomeIcons.mars, title: 'Male'),
                              ),
                            )),
                        Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  boxupdate(2);
                                });
                              },
                              child: containerbox(
                                boxcolor: femaleboxcolor,
                                childwidget: DataContainer(
                                    icon: FontAwesomeIcons.venus, title: 'Female'),
                              ),
                            ))
                      ],
                    )),
                Expanded(
                  child: Expanded(
                    child: containerbox(
                        boxcolor: Color(0xFFffffff),
                        childwidget: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Height', style: textstyle1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,

                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: textstyle2,
                                ),
                                Text('cm', style: textstyle1),
                              ],
                            ),
                            Slider(
                              value: height.toDouble(),
                              min: 120,
                              max: 220,
                              activeColor: activecolor,
                              inactiveColor: inactivecolor,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            )
                          ],
                        )),
                  ),
                ),
                Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: containerbox(
                              boxcolor: Color(0xFFffffff),
                              childwidget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Weight', style: textstyle1),
                                    Text(Weight.toString(), style: textstyle2),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                Weight++;
                                              });
                                            },
                                            backgroundColor: activecolor,
                                            child: Icon(
                                              FontAwesomeIcons.plus,
                                              color: Colors.purple,
                                            )),
                                        SizedBox(width: 10.0),
                                        FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                if (Weight > 0) {
                                                  Weight--;
                                                }
                                              });
                                            },
                                            backgroundColor: activecolor,
                                            child: Icon(
                                              FontAwesomeIcons.minus,
                                              color: Colors.purple,
                                            ))
                                      ],
                                    )
                                  ])),
                        ),
                        Expanded(
                          child: containerbox(
                              boxcolor: Color(0xFFffffff),
                              childwidget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('AGE', style: textstyle2),
                                    Text(age.toString(), style: textstyle1),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                age++;
                                              });
                                            },
                                            backgroundColor: activecolor,
                                            child: Icon(
                                              FontAwesomeIcons.plus,
                                              color: Colors.white,
                                            )),
                                        SizedBox(width: 10.0),
                                        FloatingActionButton(
                                            onPressed: () {
                                              setState(() {
                                                if (age > 0) {
                                                  age--;
                                                }
                                              });
                                            },
                                            backgroundColor: activecolor,
                                            child: Icon(
                                              FontAwesomeIcons.minus,
                                              color: Colors.white,
                                            ))
                                      ],
                                    )
                                  ])),
                        ),
                      ],
                    )),
                Container(
                  width: double.infinity,
                  height: 80.0,
                  color: inactivecolor,
                  margin: EdgeInsets.only(top: 10.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
