import 'package:flutter/material.dart';

class LengthConversion extends StatefulWidget {
  @override
  _LengthConversionState createState() => _LengthConversionState();
}

class _LengthConversionState extends State<LengthConversion> {
  late String selectedConversion;
  late double inputValue;
  late String result;

  @override
  void initState() {
    super.initState();
    selectedConversion = 'm to cm';  // Default conversion
    inputValue = 0.0;
    result = '';
  }

  double convertLength(String conversion, double value) {
    if (conversion == 'm to cm') {
      return value * 100;
    } else if (conversion == 'cm to m') {
      return value / 100;
    } else {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Length Conversion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedConversion,
              items: [
                DropdownMenuItem(child: Text('m to cm'), value: 'm to cm'),
                DropdownMenuItem(child: Text('cm to m'), value: 'cm to m'),
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
                  result = convertLength(selectedConversion, inputValue).toString();
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
