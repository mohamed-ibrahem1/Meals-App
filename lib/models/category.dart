import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
// that is a constructor to initialize the variables //////////////////////////////
  const Category({
   @required this.id,
    @required this.title,
    this.color =Colors.cyan,
  });
}
