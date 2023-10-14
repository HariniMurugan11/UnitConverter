import 'package:flutter/material.dart';

class SpeedConversion extends StatefulWidget {
  @override
  _SpeedConversionState createState() => _SpeedConversionState();
}

class _SpeedConversionState extends State<SpeedConversion> {
  late String selectedConversion;
  late double inputValue;
  late String result;

  @override
  void initState() {
    super.initState();
    selectedConversion = 'm/s to km/hr';  // Default conversion
    inputValue = 0.0;
    result = '';
  }

  double convertSpeed(String conversion, double value) {
    if (conversion == 'm/s to km/hr') {
      return value * 3.6;
    } else if (conversion == 'km/hr to m/s') {
      return value / 3.6;
    } else {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speed Conversion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedConversion,
              items: [
                DropdownMenuItem(
                    child: Text('m/s to km/hr'), value: 'm/s to km/hr'),
                DropdownMenuItem(
                    child: Text('km/hr to m/s'), value: 'km/hr to m/s'),
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
                  result = convertSpeed(selectedConversion, inputValue)
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
