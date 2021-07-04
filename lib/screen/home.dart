import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_testing_app/model/weather.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'choose_location.dart';

class Home extends StatefulWidget {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var location;
  Home(
      {this.temp,
      this.windSpeed,
      this.humidity,
      this.description,
      this.currently,
      this.location});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String bgImage1 = 'assets/images_bg.jpg';
  String bgImage2 = 'assets/images_bg2.jpg';
  var attributeSize = 15.0;

  Weather _weather = Weather();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  // }

  navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChooseLocation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage2),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      Text(
                        widget.currently != null
                            ? widget.temp.toString() + "\u00b0"
                            : "Loading",
                        style: TextStyle(color: Colors.white, fontSize: 48),
                      ),
                      Text(
                        "Currently in ${widget.location}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        color: Colors.black,
                        child: TextButton(
                          onPressed: navigate,
                          child: Text(
                            'Change Location',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 40, 10, 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.thermometerHalf),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Temperature"),
                                ],
                              ),
                              Text(
                                widget.temp != null
                                    ? widget.temp.toString() + "\u00b0"
                                    : "null",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: attributeSize,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.cloudscale),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Currently"),
                                ],
                              ),
                              Text(
                                widget.currently != null
                                    ? widget.currently.toString()
                                    : "null",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: attributeSize,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.cloud),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Description"),
                                ],
                              ),
                              Text(
                                widget.description != null
                                    ? widget.description.toString()
                                    : "null",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: attributeSize,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.sun),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Humidity"),
                                ],
                              ),
                              Text(
                                widget.humidity != null
                                    ? widget.humidity.toString()
                                    : "null",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: attributeSize,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.wind),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Wind Speed"),
                                ],
                              ),
                              Text(
                                widget.windSpeed != null
                                    ? widget.windSpeed.toString()
                                    : "null",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: attributeSize,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.locationArrow),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Location"),
                                ],
                              ),
                              Text(
                                widget.location != null
                                    ? widget.location.toString()
                                    : "null",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: attributeSize,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
