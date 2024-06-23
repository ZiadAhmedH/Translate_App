part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

// Login States
class LoadingLoginState extends AuthState {}
class SuccessLoginState extends AuthState {}
class ErrorLoginState extends AuthState {}


// SignUp States
class LoadingSignUpState extends AuthState {}
class SuccessSignUpState extends AuthState {}
class ErrorLSignUpState extends AuthState {}












// show PasswordState

class ShowPasswordState extends AuthState {}
