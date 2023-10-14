import 'package:flutter/material.dart';
import 'package:unit_converter/Conversions/CompoundInterest.dart';
import 'package:unit_converter/Conversions/SimpleInterest.dart';


class FinanceScreen extends StatelessWidget {
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
                'Finance Conversions',
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
        
        Navigator.push(context, MaterialPageRoute(builder: (context) =>SimpleInterest()));
        
        
        
        
      },
      
  
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
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
  Category(title: 'Simple Interst', icon: Icons.monetization_on),
  Category(title: 'Compound Interest', icon: Icons.account_balance),
  Category(title: 'EMI Calculator', icon: Icons.calculate),
  Category(title: 'GST Calculator', icon: Icons.receipt),
  
];

class Category {
  final String title;
  final IconData icon;

  Category({required this.title, required this.icon});
}
