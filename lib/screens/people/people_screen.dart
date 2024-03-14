import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/data/models/people_models.dart';
import 'package:homework/screens/people/widgets/person_button.dart';
import 'package:homework/utils/size_utils.dart';
import 'package:homework/view_models/people_view_model.dart';
import 'package:provider/provider.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "People",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: context.watch<PeopleViewModel>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () {
                return Future<void>.delayed(
                  const Duration(seconds: 2),
                  () {
                    context.read<PeopleViewModel>().fetchAllPerson();
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 24.h,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.65,
                  children: [
                    ...List.generate(
                      context.watch<PeopleViewModel>().allPerson.length,
                      (index) {
                        PeopleModels person =
                            context.watch<PeopleViewModel>().allPerson[index];
                        return PersonButton(peopleModels: person);
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
