import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/cubit/single_state/currency_single_cubit.dart';
import 'package:homework/data/models/currency_model.dart';

import '../../cubit/single_state/currency_single_state.dart';

class CurrenciesSingleScreen extends StatefulWidget {
  const CurrenciesSingleScreen({super.key});

  @override
  State<CurrenciesSingleScreen> createState() => _CurrenciesSingleScreenState();
}

class _CurrenciesSingleScreenState extends State<CurrenciesSingleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "All Currency with Cubit Single state",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<CurrencySingleCubit, CurrencySingleState>(
        builder: (context, state) {
          if (state.myStatus == MyStatus.error) {
            return Center(
              child: Text(state.errorText),
            );
          }
          if (state.myStatus == MyStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
        },
      ),
    );
  }
}
