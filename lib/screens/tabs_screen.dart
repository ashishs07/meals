import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/home_drawer.dart';
import './category_screens.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'screen': CategoryScreens(), 'title': 'Categories'},
      {'screen': FavouriteScreen(widget.favouriteMeals), 'title': 'Favourites'},
    ];
    super.initState();
  }

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
