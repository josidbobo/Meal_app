import 'package:flutter/material.dart';

class CategoriesMealScreen extends StatelessWidget {
  const CategoriesMealScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Recipies', 
        style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 31, fontFamily: 'Raleway-Bold.ttf', color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: const Center(
        child: Text('This is where the meals nutrients will be explained'),
      ),
    );
  }
}