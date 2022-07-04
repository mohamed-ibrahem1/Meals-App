import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'models/meal.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
///////////////////////////////////////////////////////////////////////////////////////
// السطر دة عشان اغير المكان اللي هاخد منة الوجبات بتاعتي .. متكومس\ش مباشرة من ال
//DUMMY_MEALS.....
//عشان اعرف اعمل عيها الفلتر بتاعي الاول و بعدين ابقي اخد اللي هيطلعلي بعد الفلترة بس
///////////////////////////////////////////////////////////////////////////////////////////
  List<Meal> _avalibleMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _avalibleMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && meal.isGlutenFree == false) {
          return false;
        }
        if (_filters['lactose'] == true && meal.isLactoseFree == false) {
          return false;
        }
        if (_filters['vegan'] == true && meal.isVegan == false) {
          return false;
        }
        if (_filters['vegetarian'] == true && meal.isVegetarian == false) {
          return false;
        }
        return true;
      }).toList();
    });
  }
// الدالة دي عشان تشوف العنصر في المفضلة ولا لا ...
  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
// الدالة دي لازمتها عشان ابدل الايقونه بتاعت المفضلة بس كدة 
  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(
                color: Colors.black,
              ),
              bodyText1: TextStyle(
                color: Colors.black,
              ),
              headline6: TextStyle(
                fontFamily: 'Fattern',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
      ),
      //home: MyHomePage(),
// الكود اللي جي دة بتاع الراوت عشان يخلي الصفحة الرئيسية هي بتاعت الكاتيجوري /////////////////////////////////////////////////
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_avalibleMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite , _isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'Meal',
          style: TextStyle(
            fontFamily: 'CandyBeans',
            fontSize: 40,
          ),
        ),
      ),
      body: null,
    );
  }
}
