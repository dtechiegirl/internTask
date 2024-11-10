import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/src/constants/custom_bottom_nav.dart';
import 'package:interntask/widgets/formfieldwidget.dart';
import 'package:interntask/widgets/smaller_text_widget.dart';
import 'package:interntask/discover/discover_screen.dart';
import 'package:interntask/login/bloc/login_bloc.dart';

import 'package:interntask/login/bloc/login_state.dart';

import 'package:interntask/src/constants/colors.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<LoginBloc>();
    var state = bloc.state;

    switch (state.loginStatus) {
      case LoginStatus.Initial:
        // TODO: Handle this case.
        break;
      case LoginStatus.Processing:
        // TODO: Handle this case.
        break;
      case LoginStatus.Successful:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return CustomButtomAppbar();
            },
          ));
          bloc.reset();
        });
        break;
      case LoginStatus.Error:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("An error occured")));
          bloc.resetStatusToInital();
        });
        break;
      case LoginStatus.InvaildEMailAddress:
        // TODO: Handle this case.

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("You entered an invalid email or password")));
          bloc.resetStatusToInital();
        });
        break;
      case LoginStatus.InvalidPassword:
        // TODO: Handle this case.

        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You entered a wrong password or email")));
          bloc.resetStatusToInital();
        });
        break;
    }
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 50, bottom: 20),
            child: ListView(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/syn.png",
                      height: 30,
                    ),
                  ],
                ),
                const Text(
                  "Welcome back  ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const Text(
                  "Log into your account",
                  style: TextStyle(fontSize: 16, color: AppColors.lightGrey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const smallerTextWidget(
                  text: "Work email",
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: formFieldWidget(
                    controller: _emailController,
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    saveTxt: (String value) {
                      //  print("the pass is $email");
                    },
                    hintText: "you@Synergyy.io",
                    onChanged: (String value) {
                      print("THE VALUE IS $value");
                      bloc.setEmailAddress(value);
                      //  print("the pass is $email");
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const smallerTextWidget(
                  text: "Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    height: 50,
                    child: formFieldWidget(
                      controller: _passwordController,
                      obscureText: true,
                      saveTxt: (txt) {},
                      hintText: "Enter Password",
                      suffixIcon: GestureDetector(
                        child: Image.asset(
                          "assets/images/frame.png",
                          height: 30,
                        ),
                        // onTap:  ,
                      ),
                      onChanged: (String value) {
                        print("THE VALUE IS $value");
                        bloc.setPassword(value);
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 24.0,
                          width: 24.0,
                          child: Checkbox(
                            activeColor: Colors.black,
                            value: isChecked,
                            // checkColor: Colors.amber,
                            side: const BorderSide(color: AppColors.faintGreen),
                            onChanged: (value) {
                              isChecked = true;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                              fontSize: 13, color: AppColors.lightGrey),
                        ),
                      ],
                    ),
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        bloc.onSubmit();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: state.loginStatus == LoginStatus.Processing
                          ? CircularProgressIndicator()
                          : Text(
                              "Log-In",
                              style: TextStyle(color: Colors.white),
                            ),
                    )),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don’t have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("signupscreen");
                          },
                          child: const Text(
                            "Create an account",
                            style: TextStyle(color: AppColors.faintGreen),
                          ))
                    ],
                  ),
                )
              ],
            )));
  }
}
