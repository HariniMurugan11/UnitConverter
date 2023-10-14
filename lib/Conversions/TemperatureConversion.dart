import 'package:flutter/material.dart';

class TemperatureConversion extends StatefulWidget {
  @override
  _TemperatureConversionState createState() =>
      _TemperatureConversionState();
}

class _TemperatureConversionState
    extends State<TemperatureConversion> {
  late String selectedConversion;
  late double inputValue;
  late String result;

  @override
  void initState() {
    super.initState();
    selectedConversion = 'Celsius to Fahrenheit';  // Default conversion
    inputValue = 0.0;
    result = '';
  }

  double convertTemperature(String conversion, double value) {
    if (conversion == 'Celsius to Fahrenheit') {
      return (value * 9 / 5) + 32;
    } else if (conversion == 'Fahrenheit to Celsius') {
      return (value - 32) * 5 / 9;
    } else {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Conversion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedConversion,
              items: [
                DropdownMenuItem(
                    child: Text('Celsius to Fahrenheit'),
                    value: 'Celsius to Fahrenheit'),
                DropdownMenuItem(
                    child: Text('Fahrenheit to Celsius'),
                    value: 'Fahrenheit to Celsius'),
              ],
              onChanged: (value) {
                setState(() {
                  selectedConversion = value!;
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter value',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = convertTemperature(selectedConversion, inputValue)
                      .toStringAsFixed(2); // To format the result to 2 decimal places
                });
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text('Result: $result'),
          ],
        ),
      ),
    );
  }
}
