// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:interntask/bloc/login_event.dart';
// import 'package:interntask/bloc/login_service.dart';
// import 'package:interntask/bloc/login_state.dart';
// // import 'auth_service.dart';
// // import 'auth_event.dart';
// // import 'auth_state.dart';

// class LoginBloc extends Bloc<AuthEvent, LoginState> {
//   final AuthService authService;

//   LoginBloc(this.authService) : super(AuthInitial());

//   // @override
//   // Stream<LoginState> mapEventToState(AuthEvent event) async* {
//   //   if (event is LoginEvent) {
//   //     yield AuthLoading();

//   on<LoginEvent>((event, emit) async {
//       await loginUser(emit, event);
//     });
//   }

//   loginUser(Emitter<LoginState> emit, LoginEvent event) async {
//     emit(LoginLoading());
//     Response response;

//       try {
//         // Call the API to log in
//         final result = await authService.login(event.username, event.password);

//         if (result['status'] == 'success') {
//           // On success, emit AuthSuccess with the token or other data
//           yield AuthSuccess(token: result['token']);
//         } else {
//           // On failure, emit AuthFailure with an error message
//           yield AuthFailure(errorMessage: result['message'] ?? 'Unknown error');
//         }
//       } catch (e) {
//         // Catch any errors (e.g., network issues) and emit failure state
//         yield AuthFailure(errorMessage: e.toString());
//       }
//     }
//   }
// }


// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/login/bloc/login_state.dart';
import 'package:interntask/login/repository/loginrepo.dart';
// import 'package:kowope/features/login/bloc/login_state.dart';
// import 'package:kowope/features/login/repository/login_repository.dart';

class LoginBloc extends Cubit<LoginState>{
  LoginBloc(): super(LoginState.empty);

  LoginRepository loginRepository = LoginRepository();

  void reset() async{
    emit(LoginState.empty);
  }
  void resetStatusToInital() async{
    emit(state.copyWith(loginStatus: LoginStatus.Initial));
  }
  // void logout() async{
  //    await FirebaseAuth.instance.signOut();
  // }
  void login(String emailAddress, String password) async{
     emit(state.copyWith(
      loginStatus: LoginStatus.Processing
    ));
    try{
      await loginRepository.login(emailAddress: emailAddress, password: password);
      emit(state.copyWith(loginStatus: LoginStatus.Successful));
   // await loginRepository.loginUser(email: emailAddress, password: Password)
    }catch(e,s){
      if (kDebugMode) {
        print("the error is $e $s");
      }
      emit(state.copyWith(loginStatus: LoginStatus.Error));
    }
  }
  void setEmailAddress(String emailAddress){
    var newState = state.copyWith(
      emailAddress: emailAddress
    );
    emit(newState);
  }
  // bool showPassword(bool showPassword){
  // final val =  emit(state.copyWith(showPassword: !showPassword));
  
  // }
  void setPassword(String password){
    print("the passs is $password");
    emit(state.copyWith(password: password));
  }
  void onSubmit() async{
    if (_isUserInputValid()){
      emit(state.copyWith(loginStatus: LoginStatus.Processing));
      try{
       await  loginRepository.login(emailAddress: state.emailAddress, password: state.password);
      emit(state.copyWith(loginStatus: LoginStatus.Successful));
      }catch(e,s){
        if (kDebugMode) {
          print("kini  error $e $s");
        }
        emit(state.copyWith(loginStatus: LoginStatus.Error));

      }


    }
  }
    bool _isUserInputValid() {
      String errorMessage = "";
       if (state.emailAddress.isEmpty) {
        // errorMessage = "Email cannot be empty";
         emit(state.copyWith(loginStatus: LoginStatus.InvaildEMailAddress));
          return false;
       } else if (state.password.isEmpty || state.password.length < 8) {
         emit(state.copyWith(loginStatus: LoginStatus.InvalidPassword));
         return false;
       }

      return true;
    }
  }

