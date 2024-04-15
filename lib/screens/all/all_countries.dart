import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/blocs/countries_bloc.dart';
import 'package:homework/blocs/countries_state.dart';

class AllCountriesScreen extends StatefulWidget {
  const AllCountriesScreen({super.key});

  @override
  State<AllCountriesScreen> createState() => _AllCountriesScreenState();
}

class _AllCountriesScreenState extends State<AllCountriesScreen> {
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
                    title: Text(state.countries[index].name),
                    trailing: Text(state.countries[index].emoji),
                    subtitle: Text(state.countries[index].continentName),
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
