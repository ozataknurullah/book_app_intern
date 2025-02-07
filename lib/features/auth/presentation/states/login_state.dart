class LoginState {
  final bool isLoading;
  final String? token;
  final String? errorMessage;
  final bool isValidEmail;
  final bool isValidPassword;
  final bool shouldShowDialog;

  LoginState({
    required this.isLoading,
    required this.isValidEmail,
    required this.isValidPassword,
    required this.shouldShowDialog,
    this.token,
    this.errorMessage,
  });

  // Başlangıç durumu
  factory LoginState.initial() => LoginState(
        isLoading: false,
        token: null,
        errorMessage: null,
        isValidEmail: false,
        isValidPassword: false,
        shouldShowDialog: false,
      );

  LoginState copyWith(
      {bool? isLoading,
      String? token,
      String? errorMessage,
      String? successMessage,
      bool? isValidEmail,
      bool? isValidPassword,
      bool? shouldShowDialog}) {
    return LoginState(
      shouldShowDialog: shouldShowDialog ?? this.shouldShowDialog,
      isLoading: isLoading ?? this.isLoading,
      isValidEmail: isValidEmail ?? this.isValidEmail,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      token: token ?? this.token,
      errorMessage:
          errorMessage ?? (successMessage != null ? null : this.errorMessage),
    );
  }
}
