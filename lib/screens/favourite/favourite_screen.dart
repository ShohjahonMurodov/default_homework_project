import 'package:flutter/material.dart';
import 'package:homework/data/local/local_database.dart';
import 'package:homework/data/models/coffee_models.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<CoffeeModels> coffeis = [];

  _init() async {
    coffeis = await LocalDatabase.getAllGames();
    setState(() {});
  }

  @override
  void initState() {
    print(coffeis.length);
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ...List.generate(
            coffeis.length,
            (index) => Text(coffeis[index].title),
          ),
        ],
      ),
    );
  }
}
