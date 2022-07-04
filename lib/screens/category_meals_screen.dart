import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_items.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';

  final List<Meal> avalibleMeals;

  const CategoryMealsScreen(this.avalibleMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeal;

  @override

  //الدالة دي بتفيدني لو حبيت اغير في ال state
  //ودي برضة بتتنفذ قبل منبني ال
  //Widget
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //السطر اللي تحت دة عشان تعمل فلترة لليست اللي فيها اسماء الوصفات ة التكوين بتاعها عشان تعرف تصنف فيها براحتك///////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    displayedMeal = widget.avalibleMeals.where(
      (meal) {
        return meal.categories.contains(categoryId);
      },
    ).toList();

    super.didChangeDependencies();
  }

/////////////////////////////////////////////////////////////////////////////////////////////////
  // هنا الفايدة من ال
  //initState
  //دي انها بتحمل الحاجات اللي جواها اول ماحمل الصفحة .. يعني بتسرع عملية التحميل بتاعتي
  //اللي هو الكود دة بيتنفذ قبل ميبني ال
  //Widget
  // بتاعتي اصلا
/////////////////////////////////////////////////////////////////////////////////////////////////
  ///
//الحتة اللي تحت جي بتاعت الريموف ملهاش لازمة/////////////////////////*****************//*/*/*/*/*/*/**/*/*   */ */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imageUrl: displayedMeal[index].imageUrl,
            title: displayedMeal[index].title,
            duration: displayedMeal[index].duration,
            complexity: displayedMeal[index].complexity,
            affordability: displayedMeal[index].affordability,
            id: displayedMeal[index].id,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
