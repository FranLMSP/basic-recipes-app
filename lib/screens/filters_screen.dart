import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import '../models/filters.dart';

class FiltersScreen extends StatefulWidget {
  static const ROUTE_NAME = '/filters';

  final Filters filters;
  final Function saveFiltersHandler;

  FiltersScreen(this.filters, this.saveFiltersHandler);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Filters _filters;

  @override
  void initState() {
    super.initState();
    _filters = widget.filters.copy();
  }

  Widget _buildSwitchListWidget(String title, String description, bool value, Function handler) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.saveFiltersHandler(_filters),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListWidget('Gluten-free', 'Only include gluten-free meals', _filters.glutenFree, (newValue) {
                  setState(() {
                    _filters.glutenFree = newValue;
                  });
                }),
                _buildSwitchListWidget('Lactose-free', 'Only include lactose-free meals', _filters.lactoseFree, (newValue) {
                  setState(() {
                    _filters.lactoseFree = newValue;
                  });
                }),
                _buildSwitchListWidget('Vegetarian', 'Only include vegetarian meals', _filters.vegetarian, (newValue) {
                  setState(() {
                    _filters.vegetarian = newValue;
                  });
                }),
                _buildSwitchListWidget('Vegan', 'Only include vegan meals', _filters.vegan, (newValue) {
                  setState(() {
                    _filters.vegan = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}