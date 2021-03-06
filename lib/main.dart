import 'package:flutter/material.dart';
import 'package:meals_info_hub/screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_meal_screen.dart';

import '/screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meals',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1:
                    const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                headline1: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
            
                ),
              ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 31, fontFamily: 'Raleway-Bold.ttf', 
            color: Colors.pink),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            color: Color.fromRGBO(255, 254, 229, 1),
          ),
        ),
        home: const TabsScreen(),
        //initialRoute: '/',
        routes: {
          /* Another way of describing the page the home screen is located to be used after deleting the {home:} argument
            '/': (ctx) => const TabsScreen(), */
            CategoriesMealScreen.routeName: (ctx) => const CategoriesMealScreen(),
            MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
            FilterScreen.routeName: (ctx) => const FilterScreen(),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const TabsScreen());
        });
  }
}
