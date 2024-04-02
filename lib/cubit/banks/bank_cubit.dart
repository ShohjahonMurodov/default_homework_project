import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homework/cubit/banks/bank_state.dart';
import 'package:homework/data/models/bank_models.dart';
import 'package:homework/data/models/network_response.dart';
import 'package:homework/data/provider/api_provider.dart';

class BankCubit extends Cubit<BankState> {
  BankCubit() : super(BankInitialState());

  Future<void> fetchBanks() async {
    emit(BankLoadingState());

    NetworkResponse networkResponse = await ApiProvider.getTransactions();

    if (networkResponse.errorText.isEmpty) {
      emit(BankSuccessState(
          transferModels: networkResponse.data as List<TransferModels>));
    } else {
      emit(BankErrorState(errorText: networkResponse.errorText));
    }
  }
}
