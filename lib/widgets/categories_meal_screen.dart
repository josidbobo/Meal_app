import 'package:flutter/material.dart';

class CategoriesMealScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoriesMealScreen(
      {Key? key, required this.categoryId, required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routesArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routesArguments['id'];
    //final categoryTitle = routesArguments['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.headline1?.copyWith(
              fontSize: 31,
              fontFamily: 'Raleway-Bold.ttf',
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: const Center(
        child: Text('This is where the meal\'s recipies will be explained'),
      ),
    );
  }
}
