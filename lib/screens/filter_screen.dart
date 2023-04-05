import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/Filter-Screen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var vegan = false;
  var isGlutenFree = false;
  var isLactoseFree = false;
  var vegetarian = false;

  Widget _buildSwitchListTile(String title, bool currentValue, Function(bool)? updatedValue, String description) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: currentValue,
      onChanged: updatedValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters')),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline1,
              )),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile('Gluten-Free', isGlutenFree, (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                }, 'Only include gluten free'),
              _buildSwitchListTile('Vegan', vegan, (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                }, 'Only include vegan meals'),
              _buildSwitchListTile('Lactose-free', isLactoseFree, (p0) => null, 'Only include Lactose-free meals')
            ],
          )),
        ],
      ),
    );
  }
}
