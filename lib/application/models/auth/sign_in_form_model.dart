
import 'package:dio/dio.dart';
import 'package:forsat_frontend/application/classes/errors/common_error.dart';

class SignInFormModel {
  String email;
  String password;

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

  void submitSignIn() async{

    //

   /* Dio dio = new Dio();
    Response response = await dio.get("http://10.0.2.2:8000/api/test");
    print(response);*/

   //IP: 10.78.1.17


    try {

    Dio dio = new Dio();
    Response response = await dio.post("http://10.78.1.17:8000/api/auth/login",
        data: {"email":"jhon@email.com", "password":"password"});
    print(response);

    } catch (e) {
      print(e);
    }

   /* var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.


    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.

      print("No network connection");
    }*/



  }
}


