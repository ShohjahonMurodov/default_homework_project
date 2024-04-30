import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

class ConnectState extends Equatable {
  const ConnectState({required this.connectResult, required this.hasInternet});

  final ConnectivityResult connectResult;
  final bool hasInternet;

  ConnectState copyWith(
      {ConnectivityResult? connectResult, bool? hasInternet}) {
    return ConnectState(
      connectResult: connectResult ?? this.connectResult,
      hasInternet: hasInternet ?? this.hasInternet,
    );
  }

  @override
  List<Object?> get props => [
        connectResult,
        hasInternet,
      ];
}
