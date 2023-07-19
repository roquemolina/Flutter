part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class RegisterState extends Equatable {
  const RegisterState({
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
  });

  final Username username;
  final Email email;
  final Password password;
  final FormStatus formStatus;
  final bool isValid;

  RegisterState copyWith({
    Username? username,
    Email? email,
    Password? password,
    FormStatus? formStatus,
    bool? isValid,
  }) =>
      RegisterState(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus,
      );

  @override
  List<Object> get props => [username, email, password, formStatus];
}
