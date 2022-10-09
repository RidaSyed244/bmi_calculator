import 'package:flutter/material.dart';


final activecolor = Colors.blue;
final inactivecolor = Color(0xFFffffff);

class containerbox extends StatefulWidget {
  containerbox({required this.boxcolor, required this.childwidget});
  final Color boxcolor;
  final Widget childwidget;
  @override
  State<containerbox> createState() => _containerboxState();
}

class _containerboxState extends State<containerbox> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFFffffff),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5.0,
              blurRadius: 7.0,
            ),
          ]),
    );
  }
}
