import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/cubit/multi_state/currencies_multi_state.dart';
import 'package:homework/cubit/multi_state/currencies_multi_state_cubit.dart';

import '../../data/models/currency_model.dart';

class CurrenciesMultiStateScreen extends StatefulWidget {
  const CurrenciesMultiStateScreen({super.key});

  @override
  State<CurrenciesMultiStateScreen> createState() =>
      _CurrenciesMultiStateScreenState();
}

class _CurrenciesMultiStateScreenState
    extends State<CurrenciesMultiStateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "All Currency with Cubit Multi state",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<CurrenciesMultiStateCubit, CurrenciesMultiState>(
        builder: (context, state) {
          if (state is CurrenciesLoadingMultiState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CurrenciesErrorMultiState) {
            return Center(
              child: Text(state.errorText),
            );
          }
          if (state is CurrenciesSuccessMultiState) {
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
            child: Text("Qandaydir xato chiqdi!"),
          );
        },
      ),
    );
  }
}
