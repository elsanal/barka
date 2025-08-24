import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  AuthState({required this.isAuthenticated, this.isLoading = false});
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isAuthenticated: false, isLoading: true));

  void checkAuth() async {
    await Future.delayed(Duration(seconds: 2)); // Splash delay
    // TODO: Replace with actual auth check
    bool loggedIn = false; // Example
    emit(AuthState(isAuthenticated: loggedIn));
  }

  void login() {
    emit(AuthState(isAuthenticated: true));
  }

  void logout() {
    emit(AuthState(isAuthenticated: false));
  }
}
