import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  TextEditingController _controller = TextEditingController();
  String _city = '';
  dynamic _weatherData;

  Future<void> _fetchWeather() async {
    final response = await http.get(
      Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$_city&appid=da204ac45df750edfe74fe07993d4ce6&units=metric'),
    );

    if (response.statusCode == 200) {
      setState(() {
        _weatherData = json.decode(response.body);
      });
    } else {
      print("Failed to fetch weather data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Weather ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Weather',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter City",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _city = _controller.text;
                    });
                    _fetchWeather();
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_weatherData != null)
              Column(
                children: [
                  Text(
                    "${_weatherData['main']['temp']}°C",
                    style: TextStyle(fontSize: 40),
                  ),
                  Text("${_weatherData['weather'][0]['description']}"),
                  SizedBox(height: 20),
                  Text(
                    "Humidity: ${_weatherData['main']['humidity']}%",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
