import 'package:flutter/material.dart';

import '../widgets/home_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filtersPage';

  final Map<String, bool> currentFilters;
  final Function filterUpdate;

  FiltersScreen(this.currentFilters, this.filterUpdate);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  @override
  void initState() {
    _filters['gluten'] = widget.currentFilters['gluten'];
    _filters['vegetarian'] = widget.currentFilters['vegetarian'];
    _filters['vegan'] = widget.currentFilters['vegan'];
    _filters['lactose'] = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Adjust your Meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
              _buildFilterSwitch(
                'Gluten Free',
                'Only include Gluten-Free meals',
                _filters['gluten'],
                (newValue) {
                  setState(() {
                    _filters['gluten'] = newValue;
                    widget.filterUpdate(_filters);
                  });
                },
              ),
              _buildFilterSwitch(
                'Vegetarian',
                'Only include Vegetarian meals',
                _filters['vegetarian'],
                (newValue) {
                  setState(() {
                    _filters['vegetarian'] = newValue;
                    widget.filterUpdate(_filters);
                  });
                },
              ),
              _buildFilterSwitch(
                'Vegan',
                'Only include Vegan meals',
                _filters['vegan'],
                (newValue) {
                  setState(() {
                    _filters['vegan'] = newValue;
                    widget.filterUpdate(_filters);
                  });
                },
              ),
              _buildFilterSwitch(
                'Lactose Free',
                'Only include Lactose-Free meals',
                _filters['lactose'],
                (newValue) {
                  setState(() {
                    _filters['lactose'] = newValue;
                    widget.filterUpdate(_filters);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterSwitch(
      String title, String description, bool filter, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: filter,
        subtitle: Text(description),
        onChanged: updateValue);
  }
}
