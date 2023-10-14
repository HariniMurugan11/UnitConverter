import 'package:flutter/material.dart';

class SimpleInterest extends StatefulWidget {
  @override
  _SimpleInterestState createState() =>
      _SimpleInterestState();
}

class _SimpleInterestState extends State<SimpleInterest> {
  final _formKey = GlobalKey<FormState>();
  double principal = 0.0;
  double rate = 0.0;
  double time = 0.0;
  double result = 0.0;

  void calculateSimpleInterest() {
    setState(() {
      result = (principal * rate * time) / 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Interset"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Principal Amount (\$)"),
                validator: (value) =>
                    (value == null || double.tryParse(value) == null)
                        ? "Enter a valid number"
                        : null,
                onChanged: (value) {
                  principal = double.parse(value);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Rate of Interest (%)"),
                validator: (value) =>
                    (value == null || double.tryParse(value) == null)
                        ? "Enter a valid number"
                        : null,
                onChanged: (value) {
                  rate = double.parse(value);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Time (years)"),
                validator: (value) =>
                    (value == null || double.tryParse(value) == null)
                        ? "Enter a valid number"
                        : null,
                onChanged: (value) {
                  time = double.parse(value);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calculateSimpleInterest();
                  }
                },
                child: Text("Calculate"),
              ),
              SizedBox(height: 20),
              Text("Simple Interest: \$${result.toStringAsFixed(2)}"),
            ],
          ),
        ),
      ),
    );
  }
}
