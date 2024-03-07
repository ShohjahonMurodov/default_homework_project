import 'package:easy_localization/easy_localization.dart';
import 'package:homework/data/models/category_models.dart';
import 'package:homework/data/models/coffee_models.dart';
import 'package:homework/utils/app_images.dart';

List<CoffeeModels> dataBase = [
  CoffeeModels(
      image: AppImages.coffee1,
      title: "Cappucino1",
      subtitle: "With Chocolate",
      price: 120),
  CoffeeModels(
      image: AppImages.coffee1,
      title: "Cappucino2",
      subtitle: "With Oat Milk",
      price: 120),
  CoffeeModels(
      image: AppImages.coffee1,
      title: "Cappucino3",
      subtitle: "With Chocolate",
      price: 120),
  CoffeeModels(
      image: AppImages.coffee1,
      title: "Cappucino4",
      subtitle: "With Oat Milk",
      price: 120),
];

List<CategoryModels> categoryDatabase = [
  CategoryModels(id: 1, text: "all".tr()),
  CategoryModels(id: 2, text: "mocha".tr()),
  CategoryModels(id: 3, text: "latte".tr()),
  CategoryModels(id: 4, text: "cappucino".tr()),
  CategoryModels(id: 5, text: "espresso".tr()),
];
