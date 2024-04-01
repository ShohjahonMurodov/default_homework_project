import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/cubit/country/country_cubit.dart';
import 'package:homework/cubit/country/country_state.dart';
import 'package:homework/data/models/country_models.dart';
import 'package:homework/data/models/form_status.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CountryCubit, CountryState>(
        builder: (context, state) {
          if (state.formsStatus == FormsStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.formsStatus == FormsStatus.error) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.statusText),
              ],
            );
          }
          return ListView(
            children: [
              ...List.generate(
                state.countries.length,
                (index) {
                  CountryModels countries = state.countries[index];
                  return ListTile(
                    title: Text(countries.name),
                    subtitle: Text(countries.capital),
                    trailing: Text(countries.code),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
