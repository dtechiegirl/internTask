

import 'package:equatable/equatable.dart';

enum LoginStatus{Initial, Processing, Successful, Error, InvaildEMailAddress, InvalidPassword}
bool showPassword = false;
class LoginState extends Equatable{
  const LoginState( {
    required this.emailAddress,
    required this.password,
    this.loginStatus = LoginStatus.Initial,
    // this.showPassword = false,
  });

  static LoginState empty = LoginState(
    emailAddress: "",
    password: "",
   
    
    // loginStatus: LoginStatus.Initial,
  );

  final String emailAddress;
  final String password;
  final LoginStatus loginStatus;
  // final bool showPassword ;
  @override
  List<Object?> get props => [
    emailAddress, password, loginStatus, 
    // showPassword
  ];

  LoginState copyWith({
    String? emailAddress,
    String? password,
    LoginStatus? loginStatus,
    // bool? showPassword,
  }){
    return LoginState(
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
      // showPassword: showPassword ?? this.showPassword,
    );
  }
}