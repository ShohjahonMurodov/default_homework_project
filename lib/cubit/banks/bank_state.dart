import '../../data/models/bank_models.dart';

abstract class BankState {}

class BankInitialState extends BankState {}

class BankLoadingState extends BankState {}

class BankSuccessState extends BankState {
  BankSuccessState({required this.transferModels});

  final List<TransferModels> transferModels;
}

class BankErrorState extends BankState {
  BankErrorState({required this.errorText});

  final String errorText;
}
