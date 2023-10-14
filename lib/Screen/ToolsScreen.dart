import 'package:flutter/material.dart';
import 'package:unit_converter/Conversions/StopwatchTimer.dart';
import 'package:unit_converter/Screen/MathScreen.dart';



class ToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8BBD0),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tools',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Add some spacing after the title
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // To disable scrolling in ListView.builder
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: _buildCategoryCard(context, categories[index].title, categories[index].icon),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


  Widget _buildCategoryCard(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Handle your navigation here.
        // For example:
        
        Navigator.push(context, MaterialPageRoute(builder: (context) =>StopwatchTimer()));
        //Navigator.push(context, MaterialPageRoute(builder: (context) =>MathScreen()));
        
        
        
        
      },
      
  
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          //color: Color(0xFFFFC0CB),
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: Icon(icon, size: 40.0),
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


final categories = [
  Category(title: 'Unit Converter', icon: Icons.swap_horiz),
  Category(title: 'Stopwatch & Timer', icon: Icons.access_time),
  Category(title: 'World Clock', icon: Icons.watch_later),
  Category(title: 'Currency Converter', icon: Icons.attach_money_sharp),
  
];

class Category {
  final String title;
  final IconData icon;

  Category({required this.title, required this.icon});
}
