import 'package:flutter/material.dart';
import 'package:unit_converter/Screen/FinanceScreen.dart';
import 'package:unit_converter/Screen/MathScreen.dart';
import 'package:unit_converter/Screen/ToolsScreen.dart';
import 'package:unit_converter/Screen/WeatherScreen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

final tabs = [
  ToolsScreen(),
  FinanceScreen(),
  MathScreen(),
  WeatherScreen(),
];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF80DEEA),
        title: Text("Unit Converter", style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        actions: [
          PopupMenuButton<String>(
            color: Colors.black,
          onSelected: (value) {
            //print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Tools", style: TextStyle(
                  color: Colors.white,
                ),),
                value: "Tools",

              ),
              PopupMenuItem(
                child: Text("Finance", style: TextStyle(
                  color: Colors.white,
                ),),
                value: "Finance",
              ),
              PopupMenuItem(
                child: Text("Math", style: TextStyle(
                  color: Colors.white,
                ),),
                value: "Math",
              ),
              PopupMenuItem(
                child: Text("Weather", style: TextStyle(
                  color: Colors.white,
                ),),
                value: "Weather",
              ),
            ];
          })
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,  // Active icon and text color
        unselectedItemColor: Colors.black,
        backgroundColor: Color(0xFF80DEEA),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Math',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Weather',
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        }
      ),
    );
  }
}
