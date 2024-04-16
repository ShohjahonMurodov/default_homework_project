import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/blocs/countries_bloc.dart';
import 'package:homework/blocs/countries_event.dart';
import 'package:homework/blocs/countries_state.dart';
import 'package:homework/utils/size_utils.dart';

class AllCountriesScreen extends StatefulWidget {
  const AllCountriesScreen({super.key});

  @override
  State<AllCountriesScreen> createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {
  @override
  void initState() {
    context.read<CountriesBloc>().add(FetchCountries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          60.getH(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextField(
              onChanged: (value) {
                if (value.isEmpty) {
                  context.read<CountriesBloc>().add(FetchCountries());
                } else {
                  context
                      .read<CountriesBloc>()
                      .add(FetchCountriesBySearch(name: value));
                }
              },
              cursorColor: Colors.black,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
              ),
              decoration: InputDecoration(
                hintText: "Enter a country",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                    width: 2.w,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(
                    width: 2.w,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<CountriesBloc, CountriesState>(
            builder: (context, state) {
              if (state is CountriesLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CountriesErrorState) {
                Center(
                  child: Text(state.errorText),
                );
              }
              if (state is CountriesSuccessState) {
                return SizedBox(
                  height: 735,
                  child: ListView(
                    children: [
                      ...List.generate(
                        state.countries.length,
                        (index) => ListTile(
                          title: Text(
                            state.countries[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          trailing: Text(
                            state.countries[index].emoji,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          subtitle: Text(
                            state.countries[index].continentName,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
