import 'package:flutter/material.dart';

import 'screen/choose_location.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      home: ChooseLocation(),
      theme: ThemeData(primaryColor: Colors.redAccent),
    );
  }
}
