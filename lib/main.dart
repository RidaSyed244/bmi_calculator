import 'package:flutter/material.dart';
import 'bmi_cal.dart';

void main() => runApp(MyCAL());

class MyCAL extends StatelessWidget {
  const MyCAL({super.key});

  @override
  Widget build(BuildContext context) {
    return BMI();
  }
}
