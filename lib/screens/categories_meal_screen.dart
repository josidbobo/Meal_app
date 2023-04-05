import 'package:flutter/material.dart';
import '../models/meals_data.dart';
import '../widgets/meal_item.dart';
import '../models/3.2_dummy_data.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  const CategoriesMealScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesMealScreen> createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;
 
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The !var annotation depicts a short form of <Asserts to false>
    if (!_loadedInitData) {
      final routesArguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
      final categoryId = routesArguments['id'] as String;
      categoryTitle = routesArguments['title'] as String;

      displayedMeals = dummyMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;  
    }  
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              id: displayedMeals[index].id,
              title: displayedMeals[index].title,
              imageUrl: displayedMeals[index].imageUrl,
              duration: displayedMeals[index].duration,
              complexity: displayedMeals[index].complexity,
              affordability: displayedMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayedMeals.length),
    );
  }
}
