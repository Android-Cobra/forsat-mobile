import 'package:flutter/material.dart';
import 'package:forsat_frontend/application/models/auth/sign_up_form_model.dart';
import 'package:forsat_frontend/router/route_constants.dart';
import 'package:forsat_frontend/values/branding_color.dart';
import 'package:forsat_frontend/values/image.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.transparent, //No Action bar
        elevation: 0, //No elevation of Action bar
        brightness: Brightness.light, // Have black status bar icons
        automaticallyImplyLeading: false, //No Back button
      ),
      body: Injector(
          inject: [Inject<SignUpFormModel>(() => SignUpFormModel())],
          builder: (context) {
            final _singletonSignUpFormModel =
            Injector.getAsReactive<SignUpFormModel>();
            return Container(
              padding: EdgeInsets.all(16),
              child: ListView(
                //This is Scroll view
                children: [
                  Container(
                    height: 250,
                    child: Center(
                      child: Image.asset(Images.logo),
                    ),
                  ),
                  StateBuilder<SignUpFormModel>(
                    builder: (context, signUpFormModel) {
                      return TextFormField(
                        onChanged: (String firstName) {
                          //print(email);
                          signUpFormModel.setState(
                                  (state) => state.setFirstName(firstName),
                              catchError: true);
                        },
                        decoration: InputDecoration(
                            errorText: signUpFormModel.hasError
                                ? signUpFormModel.error.message
                                : null,
                            prefixIcon: Icon(Icons.person),
                            hintText: "Enter your first name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      );
                    },
                  ),
                  buildSizedBox(15),
                  StateBuilder<SignUpFormModel>(
                    builder: (context, signUpFormModel) {
                      return TextFormField(
                        onChanged: (String lastName) {
                          //print(email);
                          signUpFormModel.setState(
                                  (state) => state.setLastName(lastName),
                              catchError: true);
                        },
                        decoration: InputDecoration(
                            errorText: signUpFormModel.hasError
                                ? signUpFormModel.error.message
                                : null,
                            prefixIcon: Icon(Icons.person),
                            hintText: "Enter your last name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      );
                    },
                  ),
                  buildSizedBox(15),
                  StateBuilder<SignUpFormModel>(
                    builder: (context, signUpFormModel) {
                      return TextFormField(
                        onChanged: (String email) {
                          //print(email);
                          signUpFormModel.setState(
                                  (state) => state.setEmail(email),
                              catchError: true);
                        },
                        decoration: InputDecoration(
                            errorText: signUpFormModel.hasError
                                ? signUpFormModel.error.message
                                : null,
                            prefixIcon: Icon(Icons.email),
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      );
                    },
                  ),
                  buildSizedBox(15),
                  StateBuilder<SignUpFormModel>(
                      builder: (context, signUpFormModel) {
                        return TextFormField(
                          obscureText: true,
                          onChanged: (String password) {
                            //print(password);
                            signUpFormModel.setState(
                                    (state) => state.setPassword(password),
                                catchError: true);
                          },
                          decoration: InputDecoration(
                              errorText: signUpFormModel.hasError
                                  ? signUpFormModel.error.message
                                  : null,
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Enter your password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        );
                      }),
                  buildSizedBox(15),
                  StateBuilder<SignUpFormModel>(
                      builder: (context, signUpFormModel) {
                        return TextFormField(
                          obscureText: true,
                          onChanged: (String confirmPassword) {
                            //print(password);
                            signUpFormModel.setState(
                                    (state) => state.setConfirmPassword(confirmPassword),
                                catchError: true);
                          },
                          decoration: InputDecoration(
                              errorText: signUpFormModel.hasError
                                  ? signUpFormModel.error.message
                                  : null,
                              prefixIcon: Icon(Icons.lock),
                              hintText: "Enter confirm password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30))),
                        );
                      }),
                  buildSizedBox(25),
                  StateBuilder(
                    //models : [_singletonSignUpFormModel],
                    builder: (_, ReactiveModel<SignUpFormModel> myModel) {
                      return MaterialButton(
                        onPressed: () {
                          //print("onPressed");
                          if (!_singletonSignUpFormModel.state.validateData()) {
                            _key.currentState.showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Data is invalid"),
                            ));
                          }
                        },
                        height: 55,
                        shape: StadiumBorder(),
                        color: brandingColor,
                        child: Container(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      );
                    },
                  ),
                  buildSizedBox(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Already have account?"),
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, signInRoute);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: brandingColor),
                          )),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  SizedBox buildSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}