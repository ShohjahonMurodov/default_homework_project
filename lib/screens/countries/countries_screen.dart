import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/blocs/countries_bloc.dart';
import 'package:homework/blocs/countries_event.dart';
import 'package:homework/blocs/countries_state.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key, required this.query});

  final String query;

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  void initState() {
    context.read<CountriesBloc>().add(
          FetchCountriesByContinent(query: widget.query),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountriesBloc, CountriesState>(
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
            return ListView(
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
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
