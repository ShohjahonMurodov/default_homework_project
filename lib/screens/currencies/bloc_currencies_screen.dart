import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/bloc/currency/currency_state.dart';
import 'package:homework/bloc/currency/currency_bloc.dart';
import 'package:homework/data/models/currency_model.dart';

class BlocCurrencyScreen extends StatefulWidget {
  const BlocCurrencyScreen({super.key});

  @override
  State<BlocCurrencyScreen> createState() => _BlocCurrencyScreenState();
}

class _BlocCurrencyScreenState extends State<BlocCurrencyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "All Currency with bloc",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<CurrencyBloc, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyErrorState) {
            return Center(
              child: Text(state.errorText),
            );
          }
          if (state is CurrencyLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CurrencySuccessState) {
            return ListView(
              children: [
                ...List.generate(
                  state.currencies.length,
                  (index) {
                    CurrencyModel currencyModel = state.currencies[index];
                    return ListTile(
                      onTap: () {},
                      title: Text(
                        currencyModel.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        currencyModel.date,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Text(
                        currencyModel.code,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return const Center(
            child: Text("Hech qaysiga tushmadi"),
          );
        },
      ),
    );
  }
}
