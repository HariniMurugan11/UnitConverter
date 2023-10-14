import 'package:flutter/material.dart';

class VolumeConversion extends StatefulWidget {
  @override
  _VolumeConversionState createState() => _VolumeConversionState();
}

class _VolumeConversionState extends State<VolumeConversion> {
  late String selectedConversion;
  late double inputValue;
  late String result;

  @override
  void initState() {
    super.initState();
    selectedConversion = 'm³ to cm³';  // Default conversion
    inputValue = 0.0;
    result = '';
  }

  double convertVolume(String conversion, double value) {
    if (conversion == 'm³ to cm³') {
      return value * 1000000;  // Since 1 m³ = 1,000,000 cm³
    } else if (conversion == 'cm³ to m³') {
      return value / 1000000;
    } else {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volume Conversion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedConversion,
              items: [
                DropdownMenuItem(
                    child: Text('m³ to cm³'), value: 'm³ to cm³'),
                DropdownMenuItem(
                    child: Text('cm³ to m³'), value: 'cm³ to m³'),
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
                  result = convertVolume(selectedConversion, inputValue)
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
