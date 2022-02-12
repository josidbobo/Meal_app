import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/3.2%20dummy_data.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  const CategoriesMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routesArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final categoryId = routesArguments['id'] as String;
    final categoryTitle = routesArguments['title'] as String;

    final categoryMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

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
      body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration, 
              complexity: categoryMeals[index].complexity, 
              affordability: categoryMeals[index].affordability,);
          },
          itemCount: categoryMeals.length),
    );
  }
}
