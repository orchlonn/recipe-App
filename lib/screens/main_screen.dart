import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatelessWidget {
  final String username;
  MainScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${username} <- Entered with this",
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<City> futureWeather;
  @override
  void initState() {
    super.initState();
    futureWeather = fetchData();
  }

  Future<City> fetchData() async {
    final response = await http
        .get(Uri.parse('https://weather.endigo.vercel.app/api/cities'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final body = jsonDecode(response.body);
      print(body);
      return City.fromJson(body[0]);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<City>(
      future: futureWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.name);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    ));
  }
}

class City {
  final String key;
  final String image;
  final String name;
  final List<dynamic> weathers;
  City({
    required this.key,
    required this.image,
    required this.name,
    required this.weathers,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    // json array -> List<City>

    return City(
      key: json['key'],
      name: json['name'],
      weathers: json['weathers'],
      image: json['image'],
    );
  }
}

class Weather {
  final String date;
  final int temperatureNight;
  final int temperatureDay;
  final int phenoIDNight;
  final String phenoNight;
  final int phenoIDDay;
  final String phenoDay;
  final int windNight;
  final int windDay;

  Weather(
    this.date,
    this.temperatureNight,
    this.temperatureDay,
    this.phenoIDNight,
    this.phenoNight,
    this.phenoIDDay,
    this.phenoDay,
    this.windNight,
    this.windDay,
  );

  factory Weather.fromJson(Map<String, dynamic> json) {
    // json array -> List<City>

    return Weather(
      json['Date'],
      json['TemperatureNight'],
      json['TemperatureDay'],
      json['PhenoIDNight'],
      json['PhenoNight'],
      json['PhenoIDDay'],
      json['PhenoDay'],
      json['WindNight'],
      json['WindDay'],
    );
  }
}
