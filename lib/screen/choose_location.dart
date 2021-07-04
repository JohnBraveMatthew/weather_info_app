import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testing_app/model/weather.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var location;

  List<Weather> locations = [
    Weather(location: "London", url: 'London', imageUrl: 'assets/england.jpg'),
    Weather(
        location: "Nigeria", url: 'Nigeria', imageUrl: 'assets/nigeria.png'),
    Weather(location: "Berlin", url: 'Berlin', imageUrl: 'assets/germany.png'),
    Weather(
        location: "Lagos - Nigeria",
        url: 'Lagos',
        imageUrl: 'assets/nigeria.png'),
    Weather(
        location: "Calabar - Nigeria",
        url: 'Calabar',
        imageUrl: 'assets/nigeria.png'),
    Weather(
        location: "Nsukka - Nigeria",
        url: 'Nsukka',
        imageUrl: 'assets/nigeria.png'),
    Weather(
        location: "Kano - Nigeria",
        url: 'Kano',
        imageUrl: 'assets/nigeria.png'),
    Weather(
        location: "Enugu - Nigeria",
        url: 'Enugu',
        imageUrl: 'assets/nigeria.png'),
    Weather(
        location: "Ogoja - Nigeria",
        url: 'Ogoja',
        imageUrl: 'assets/nigeria.png'),
  ];
  Weather _weather = Weather();
  // String location;

  // Future fetchWeatherInfo() async {
  //   await _weather.getWeatherInfo();
  // }

  Future getWeatherInfo(url) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${url}&appid=78178204dd399e57e8c35a54fe357104'));
    var result = jsonDecode(response.body);

    print(result);

    temp = result['main']['temp'];
    currently = result['main']['feels_like'];
    description = result['weather'][0]['description'];
    humidity = result['main']['humidity'];
    windSpeed = result['wind']['speed'];
    location = result['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select location'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(locations[index].location),
              onTap: () async {
                _weather.url = locations[index].url;
                await getWeatherInfo(locations[index].url);
                print(temp);
                print(currently);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(
                      temp: temp,
                      location: locations[index].location,
                      currently: currently,
                      description: description,
                      humidity: humidity,
                      windSpeed: windSpeed,
                    ),
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage(locations[index].imageUrl),
              ),
            ),
          );
        },
      ),
    );
  }
}
