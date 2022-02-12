import 'package:flutter/material.dart';
import 'package:meals_info_hub/models/3.2%20dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildListTitle(BuildContext context, text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(text, style: Theme.of(context).textTheme.headline1),
    );
  }

  Widget buildContainer({required child, height = 150.0}) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      height: height,
      width: 285,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealParams = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealParams);
    print(selectedMeal.imageUrl);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: Theme.of(context).textTheme.headline1?.copyWith(
              fontSize: 31,
              fontFamily: 'Raleway-Bold.ttf',
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              child: Image.asset(selectedMeal.imageUrl, fit: BoxFit.contain),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          buildListTitle(context, 'Ingredients'),
          buildContainer(
            child: ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Text(selectedMeal.ingredients[index],
                    style: Theme.of(context).textTheme.bodyText1,
                    softWrap: true,
                    overflow: TextOverflow.fade),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildListTitle(context, 'Steps'),
          buildContainer(
            child: ListView.builder(
              padding: const EdgeInsets.all(9),
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        '# ${index + 1}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                  ),
                  const Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ),
            height: 290.0,
          ),
        ],
      ),
    );
  }
}
