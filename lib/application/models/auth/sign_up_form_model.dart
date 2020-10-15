
import 'package:forsat_frontend/application/classes/errors/common_error.dart';

class SignUpFormModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;

  void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  void setLastName(String lastName) {
    this.lastName = lastName;
  }

  void setEmail(String email) {
    //print(email);
    //Check email validation
    if (!validateEmail(email)) {
      //print("Invalid email: $email");
      throw CommonError(message: "Invalide email");
    }

    this.email = email;
  }

  void setPassword(String password) {
    //Check password validation
    if (password.length < 6) {
      throw CommonError(message: "Password length should be more than 6 chars");
    }

    this.password = password;
  }

  void setConfirmPassword(String password) {
    this.confirmPassword =  password;
  }

  bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool validateData() {
    return this.email != null &&
        this.password != null &&
        this.password.length > 6 &&
        this.validateEmail(this.email);
  }
}

