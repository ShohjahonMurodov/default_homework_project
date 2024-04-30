abstract class ConnectEvent {
  const ConnectEvent();
}

class CheckConnect extends ConnectEvent {
  @override
  List<Object?> get props => [];
}

class InitialCheckConnect extends ConnectEvent {
  @override
  List<Object?> get props => [];
}
