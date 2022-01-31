import 'package:flutter/material.dart';

class CategoriesMealScreen extends StatelessWidget {
  const CategoriesMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routesArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final categoryId = routesArguments['id'].toString();
    final categoryTitle = routesArguments['title'].toString();
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
      body: Center(
        child: Text(
            'This is where the $categoryTitle recipe will be explained'),
      ),
    );
  }
}
