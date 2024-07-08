import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/blocs/currency_bloc.dart';
import 'package:homework/blocs/currency_state.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CurrencyErrorState) {
            return Center(
              child: Text(state.errorText),
            );
          }
          if (state is CurrencySuccessState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    state.currencies.length,
                    (index) {
                      var data = state.currencies[index];
                      return ListTile(
                        title: Text(data.ccy),
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text("Hech qaysiga tushmadi :("),
          );
        },
      ),
    );
  }
}
