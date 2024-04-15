import 'package:flutter/material.dart';
import 'package:homework/screens/all/all_countries.dart';
import 'package:homework/screens/controller/widgets/controller_items.dart';
import 'package:homework/screens/countries/countries_screen.dart';
import 'package:homework/utils/size_utils.dart';

class ControllerScreen extends StatelessWidget {
  const ControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControllerItems(
              title: "All",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllCountriesScreen(),
                  ),
                );
              },
            ),
            ControllerItems(
                title: "Asia",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CountriesScreen(query: 'AS'),
                    ),
                  );
                }),
            ControllerItems(
                title: "Europe",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CountriesScreen(
                        query: 'EU',
                      ),
                    ),
                  );
                }),
            ControllerItems(
                title: "North America",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CountriesScreen(query: 'NA'),
                    ),
                  );
                }),
            ControllerItems(
                title: "South America",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CountriesScreen(query: 'SA'),
                    ),
                  );
                }),
            ControllerItems(
                title: "Africa",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CountriesScreen(query: 'AF'),
                    ),
                  );
                }),
            ControllerItems(
                title: "Australia",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CountriesScreen(query: 'AU'),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
