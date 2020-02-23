import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 140,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomLeft,
            child: Text(
              'Coming Up!',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          _buildDrawerListTile(context, 'Home', Icons.home, () {
            Navigator.of(context).pushNamed('/');
          }),
          Divider(thickness: 2),
          _buildDrawerListTile(context, 'Filters', Icons.restaurant, () {
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget _buildDrawerListTile(
      BuildContext context, String title, IconData icon, Function tapHandler) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      trailing: Icon(icon),
      onTap: tapHandler,
    );
  }
}
