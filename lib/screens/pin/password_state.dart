class PasswordState {
  String password;
  PasswordStatus passwordStatus;
  bool isTruePassword;

  PasswordState(
      {required this.password,
      required this.passwordStatus,
      this.isTruePassword = false});

  PasswordState copyWithPassword({
    String? password,
    PasswordStatus? passwordStatus,
    bool? isTruePassword,
  }) {
    return PasswordState(
      password: password ?? this.password,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      isTruePassword: isTruePassword ?? this.isTruePassword,
    );
  }
}

enum PasswordStatus {
  newPassword,
  error,
  ok,
}
