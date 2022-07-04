import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  // دة اسم الراوت بتاعنا///////////////////////////////////////////
  static const routeName = 'meal_detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(color: Colors.grey[700]),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 400,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // هنا الطريقة اللي هتستقبل بيها ال اي دي
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            //دة كدة المفروض اوبجيكن من الكلاس ويدجت اللي فوق /////////////////////////////////////////////////////////
            buildSectionTitle('Ingredients', context),
            //اللي موجود جوه البيلد كونتينر دة هو الشايلد اللي معرفينه فوق////////////////////////////////////////////
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Colors.redAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            // هنا احنا استخدمنا نفس الكلاس عشان نكتب العنوات بتاع ال استبس بنفس الطريقة//////////////////////////////////////
            buildSectionTitle('Steps', context),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(
                    thickness: 1.3,
                  ),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>toggleFavorite(mealId),
        child: Icon(
          isFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
        ),
      ),
    );
  }
}
// الكلام المهم بتاع ال
//route
// هتلاقية في الفيديو رقم 105 و 106
