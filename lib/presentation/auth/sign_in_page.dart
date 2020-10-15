import 'package:flutter/material.dart';
import 'package:forsat_frontend/application/models/auth/sign_in_form_model.dart';
import 'package:forsat_frontend/router/route_constants.dart';
import 'package:forsat_frontend/values/branding_color.dart';
import 'package:forsat_frontend/values/image.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print("Calling build method");
    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.transparent, //No Action bar
        elevation: 0, //No elevation of Action bar
        brightness: Brightness.light, // Have black status bar icons
        automaticallyImplyLeading: false, //No Back button
      ),
      body: Injector(
          inject: [Inject<SignInFormModel>(() => SignInFormModel())],
          builder: (context) {
            final _singletonSignInFormModel =
                Injector.getAsReactive<SignInFormModel>();
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
                  StateBuilder<SignInFormModel>(
                    builder: (context, signInFormModelEmail) {
                      return TextFormField(
                        onChanged: (String email) {
                          //print(email);
                          signInFormModelEmail.setState(
                              (state) => state.setEmail(email),
                              catchError: true);
                        },
                        decoration: InputDecoration(
                            errorText: signInFormModelEmail.hasError
                                ? signInFormModelEmail.error.message
                                : null,
                            prefixIcon: Icon(Icons.email),
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      );
                    },
                  ),
                  buildSizedBox(15),
                  StateBuilder<SignInFormModel>(
                      builder: (context, signInFormModelPassword) {
                    return TextFormField(
                      obscureText: true,
                      onChanged: (String password) {
                        //print(password);
                        signInFormModelPassword.setState(
                            (state) => state.setPassword(password),
                            catchError: true);
                      },
                      decoration: InputDecoration(
                          errorText: signInFormModelPassword.hasError
                              ? signInFormModelPassword.error.message
                              : null,
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Enter your password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    );
                  }),
                  buildSizedBox(25),
                  StateBuilder(
                    //models : [_singletonSignInFormModel],
                    builder: (_, ReactiveModel<SignInFormModel> myModel) {
                      return MaterialButton(
                        onPressed: () {
                          //print("onPressed");
                          if (!_singletonSignInFormModel.state.validateData()) {
                            /*_key.currentState.showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Data is invalid"),
                            ));*/

                            _singletonSignInFormModel.setState(
                                    (signInFormState) =>
                                    signInFormState.submitSignIn());
                          } else {
                            _singletonSignInFormModel.setState(
                                (signInFormState) =>
                                    signInFormState.submitSignIn());
                          }
                        },
                        height: 55,
                        shape: StadiumBorder(),
                        color: brandingColor,
                        child: Container(
                          child: Text(
                            'Sign In',
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
                      Text("Don't have account?"),
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, signUpRoute);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: brandingColor),
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
