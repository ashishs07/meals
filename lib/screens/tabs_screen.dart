import 'package:flutter/material.dart';

import '../widgets/home_drawer.dart';
import './category_screens.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {'screen': CategoryScreens(), 'title': 'Categories'},
    {'screen': FavouriteScreen(), 'title': 'Favourites'},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: HomeDrawer(),
      body: _pages[_selectedPageIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          )
        ],
        onTap: _selectPage,
      ),
    );
  }
}

/* TopNavigationBar
DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'All',
              ),
              Tab(
                icon: Icon(Icons.favorite_border),
                text: 'Fav',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryScreens(),
            FavouriteScreen(),
          ],
        ),
      ),
    ) 
*/
