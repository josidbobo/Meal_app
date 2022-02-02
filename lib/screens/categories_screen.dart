import 'package:flutter/material.dart';
import '../models/3.2 dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text('Delicious Meals',
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 31, fontFamily: 'Raleway-Bold.ttf'))),
      body: GridView(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                // width of the Grid.
                maxCrossAxisExtent: 200,
                // How the items should be sized regarding their height and width relation.
                childAspectRatio: 3 / 2,
                // spacing between them cross wise.
                crossAxisSpacing: 20,
                // spacing between them main wise ie down the GRID.
                mainAxisSpacing: 20,
              ),
              children: dummyCategories
                  .map((item) =>
                      CategoryItem(title: item.title, color: item.color, id: item.id,))
                  .toList(),
            ),
    );
  }
}
