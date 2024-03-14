import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/country_models.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:homework/view_models/country_view_model.dart';
import 'package:provider/provider.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "Countries",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: context.watch<CountryViewModel>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () {
                return Future<void>.delayed(
                  const Duration(seconds: 2),
                  () {
                    context.read<CountryViewModel>().fetchAllCountry();
                  },
                );
              },
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  ...List.generate(
                    context.watch<CountryViewModel>().allCountry.length,
                    (index) {
                      CountryModels country =
                          context.watch<CountryViewModel>().allCountry[index];
                      return ListTile(
                        onTap: () {},
                        title: Text(country.region),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
