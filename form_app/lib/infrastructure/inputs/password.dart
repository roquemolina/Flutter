import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  // Call super.pure to represent an unmodified form input.
  //Initial value
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  // how value change
  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordError.empty) return 'Password required';
    if (displayError == PasswordError.length) return 'Password require more than 6 letters';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.trim().length < 6) {
      return PasswordError.length;
    }
    //All OK!
    return null;
  }
}
