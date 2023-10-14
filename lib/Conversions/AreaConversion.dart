import 'package:flutter/material.dart';

class AreaConversion extends StatefulWidget {
  @override
  _AreaConversionState createState() => _AreaConversionState();
}

class _AreaConversionState extends State<AreaConversion> {
  late String selectedConversion;
  late double inputValue;
  late String result;

  @override
  void initState() {
    super.initState();
    selectedConversion = 'm² to cm²';  // Default conversion
    inputValue = 0.0;
    result = '';
  }

  double convertArea(String conversion, double value) {
    if (conversion == 'm² to cm²') {
      return value * 10000;
    } else if (conversion == 'cm² to m²') {
      return value / 10000;
    } else {
      return value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Area Conversion'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedConversion,
              items: [
                DropdownMenuItem(child: Text('m² to cm²'), value: 'm² to cm²'),
                DropdownMenuItem(child: Text('cm² to m²'), value: 'cm² to m²'),
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
                  result = convertArea(selectedConversion, inputValue).toString();
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
