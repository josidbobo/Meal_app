import 'package:flutter/material.dart';
import 'package:meals_info_hub/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/Filter-Screen';
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filters')),
      drawer: MainDrawer(),
      body: Center(
        child: Text('This is my filters Screen'),
      ),
    );
  }
}
