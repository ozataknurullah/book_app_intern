class RegisterState {
  final bool isLoading;
  final String? token;
  final String? errorMessage;
  final bool isValidEmail;
  final bool isValidName;
  final bool isValidPassword;

  RegisterState({
    required this.isLoading,
    required this.isValidEmail,
    required this.isValidName,
    required this.isValidPassword,
    this.token,
    this.errorMessage,
  });

  // Başlangıç durumu
  factory RegisterState.initial() => RegisterState(
        isLoading: false,
        token: null,
        errorMessage: null,
        isValidEmail: false,
        isValidName: false,
        isValidPassword: false,
      );

  RegisterState copyWith({
    bool? isLoading,
    String? token,
    String? errorMessage,
    String? successMessage,
    bool? isValidEmail,
    bool? isValidName,
    bool? isValidPassword,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      isValidName: isValidName ?? this.isValidName,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      token: token ?? this.token,
      errorMessage: errorMessage,
    );
  }
}
