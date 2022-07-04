import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon ,Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 23),
            alignment: Alignment.bottomCenter,
            height: 120,
            width: double.infinity,
            color: Colors.red,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Fattern'),
            ),
          ),
          SizedBox(height: 15),
          buildListTile('Meal', Icons.restaurant_menu , (){Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile('Filters', Icons.settings , (){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),
        ],
      ),
    );
  }
}
