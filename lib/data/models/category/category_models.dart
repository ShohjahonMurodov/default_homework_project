import 'package:flutter/material.dart';
import 'package:homework/utils/app_images.dart';

class CategoryModels {
  final String text;
  final String image;
  final Color color;

  CategoryModels(
      {required this.text, required this.image, required this.color});
}

List<CategoryModels> dataBase = [
  CategoryModels(
    text: "Vegetables",
    image: AppImages.vegetables,
    color: Colors.lightBlueAccent,
  ),
  CategoryModels(
    text: "Fruit",
    image: AppImages.fruits,
    color: Colors.yellowAccent,
  ),
  CategoryModels(
    text: "Spice",
    image: AppImages.spice,
    color: Colors.pinkAccent,
  ),
  CategoryModels(
    text: "Ingridients",
    image: AppImages.ingridients,
    color: Colors.greenAccent,
  ),
  CategoryModels(
    text: "Side Dishes",
    image: AppImages.sideDishes,
    color: Colors.orangeAccent,
  ),
  CategoryModels(
    text: "Vegetables",
    image: AppImages.vegetables,
    color: Colors.lightBlueAccent,
  ),
  CategoryModels(
    text: "Fruit",
    image: AppImages.fruits,
    color: Colors.yellowAccent,
  ),
  CategoryModels(
    text: "Spice",
    image: AppImages.spice,
    color: Colors.pinkAccent,
  ),
  CategoryModels(
    text: "Ingridients",
    image: AppImages.ingridients,
    color: Colors.greenAccent,
  ),
  CategoryModels(
    text: "Side Dishes",
    image: AppImages.sideDishes,
    color: Colors.orangeAccent,
  ),
];
