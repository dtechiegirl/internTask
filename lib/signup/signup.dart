import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/signup/bloc/signup_bloc.dart';
import 'package:interntask/signup/bloc/signup_state.dart';
import 'package:interntask/src/constants/custom_bottom_nav.dart';
import 'package:interntask/widgets/formfieldwidget.dart';
import 'package:interntask/widgets/smaller_text_widget.dart';
import 'package:interntask/src/constants/colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
    String firstName = "";
    String lastName = "";
    String phoneNumber = "";
  String emailAddress = "";
  String password = "";
 bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
     SignupBloc bloc = context.watch<SignupBloc>();
    SignupState state = bloc.state;

    switch(state.signupStatus){
      case SignupStatus.Initial:
        break;
      case SignupStatus.Processing:
      // TODO: Handle this case.
        break;
      case SignupStatus.Successful:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) {
                return CustomButtomAppbar();
              },
              )
          );
          bloc.reset;
        });
        break;
      case SignupStatus.Error:
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger
              .of(context)
              .showSnackBar(SnackBar(content: Text("An error occured")));
        });
        break;
    }
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20.0, top: 50, bottom: 20),
        child: ListView(
          children: [
            Text(
              "Create Your Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              "Discover top talent",
              style: TextStyle(fontSize: 16, color: AppColors.lightGrey),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.zero,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                childAspectRatio: (1 / .6),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const smallerTextWidget(text: "First Name"),
                          formFieldWidget(
                            obscureText: false,
                            saveTxt: (saveTxt) {},
                            hintText: "First name",
                            onChanged: (String value) {
                              firstName = value;
                            },
                          ),
                        ],
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const smallerTextWidget(text: "Last Name"),
                          formFieldWidget(
                            obscureText: false,
                            saveTxt: (saveTxt) {},
                            hintText: "Last Name",
                            onChanged: (String value) {
                              lastName = value;
                            },
                          ),
                        ],
                      )),
                ]),
            smallerTextWidget(
              text: "Work email",
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 50,
                child: formFieldWidget(
                  obscureText: false,
                  saveTxt: (saveTxt) {},
                  hintText: "you@company.com",
                  onChanged: (String value) {
                    emailAddress = value;
                  },
                )),
            SizedBox(
              height: 20,
            ),
            smallerTextWidget(
              text: "Phone Number",
            ),
            formFieldWidget(obscureText: false, saveTxt: (saveTxt){}, onChanged: (value){
              phoneNumber = value;
            }, hintText: "Add Phone Number",),
            // IntlPhoneField(
            //   // dropdownIcon: Icon(Icons.arrow_drop_down_outlined),
            //   onChanged: (PhoneNumber phoneNumber) {
            //     phoneNumber = phoneNumber;
            //   },
            //   initialCountryCode: "+234",
            //   dropdownIconPosition: IconPosition.trailing,
            //   disableLengthCheck: true,
            //   decoration: InputDecoration(
            //       errorBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //           borderSide: BorderSide(color: Colors.red, width: 1.5)),
            //       focusedErrorBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //           borderSide: BorderSide(color: Colors.red, width: 1.5)),
            //       // label: Text("Enter Student ID"),

            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //           borderSide:
            //               BorderSide(color: Colors.grey.shade400, width: 1.5)),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8),
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 1.5),
            //       ),
                  
            //       hintText: "Add phone number"),
            // ),
           
           
           
           
            SizedBox(
              height: 10,
            ),
            smallerTextWidget(
              text: "Password",
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 50,
                child: formFieldWidget(
                  obscureText: false,
                  saveTxt: (saveTxt) {},
                  hintText: "Enter Password",
                  suffixIcon: Image.asset(
                    "assets/images/frame.png",
                    height: 30,
                  ),
                  onChanged: (String value) {
                    password = value;
                  },
                )),
            Text(
              "Use 8 or more characters with uppercase and numbers.",
              style: TextStyle(fontSize: 12, color: AppColors.lightGrey),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "By signing up you agree to our ",
                  style: TextStyle(fontSize: 13, color: AppColors.lightGrey),
                ),
                Text(
                  "Privacy Policy ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "and",
                  style: TextStyle(fontSize: 13, color: AppColors.lightGrey),
                ),
              ],
            ),
            Text(
              "Terms of Service",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 50,
                child: ElevatedButton(
                  onPressed: state.signupStatus == SignupStatus.Processing ? null : () {
                          if (_isUserInputValid()) {
                            bloc.registerUser(
                                firstName: firstName,
                                emailAddress: emailAddress,
                                phoneNumber: phoneNumber,
                                lastName: lastName,
                                password: password);
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/");
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: AppColors.faintGreen),
                      )
                      
                      )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
   bool _isUserInputValid() {
    String errorMessage = "";
    if (firstName.trim().isEmpty || lastName.trim().isEmpty ||phoneNumber.trim().isEmpty) {
      errorMessage = "Fullname cannot be empty";
    } else if (emailAddress.trim().isEmpty) {
      errorMessage = "Email cannot be empty";
    } else if (password.trim().isEmpty || password.length < 8) {
      errorMessage = "Password must not be less that 8";
    }
    if (errorMessage.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errorMessage)));
      return false;
    }

    return true;
  }
}

