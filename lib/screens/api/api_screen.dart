import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework/cubit/banks/bank_cubit.dart';
import 'package:homework/cubit/banks/bank_state.dart';
import 'package:homework/data/models/bank_models.dart';
import 'package:homework/utils/size_utils.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocBuilder<BankCubit, BankState>(
        builder: (context, state) {
          if (state is BankLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BankErrorState) {
            return Center(
              child: Text(state.errorText),
            );
          } else if (state is BankSuccessState) {
            return ListView(
              children: [
                ...List.generate(
                  state.transferModels.length,
                  (index) {
                    TransferModels bank = state.transferModels[index];
                    return Container(
                      margin: EdgeInsets.only(
                        left: 24.w,
                        right: 24.w,
                        bottom: 15.h,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: ListTile(
                        onTap: () {},
                        leading: bank.data[0].sender.name == "Najot Ta'lim"
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Image.network(
                                    "https://api.logobank.uz/media/logos_png/Najot_Talim-01.png"),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: Image.network(
                                    bank.data[0].sender.brandImage),
                              ),
                        title: Text(
                          bank.data[0].sender.name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          bank.data[0].sender.location,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: Text(
                          bank.data[0].amount.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  },
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
