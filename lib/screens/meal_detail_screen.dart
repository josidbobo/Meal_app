import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final mealId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealId, 
        style: Theme.of(context).textTheme.headline1?.copyWith(
              fontSize: 31,
              fontFamily: 'Raleway-Bold.ttf',
              color: Theme.of(context).colorScheme.primary),
              ),),
      body: const Center(child: Text('This is where each meal will be explained'),),
    );
  }
}
