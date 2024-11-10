import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interntask/signup/bloc/signup_state.dart';
import 'package:interntask/signup/repository/signuprepo.dart';

class SignupBloc extends Cubit<SignupState>{
  SignupBloc(): super(SignupState.empty);

  SignupRepository signupRepository = SignupRepository();

  void reset(){
    emit(SignupState.empty);
  }
  void registerUser({
    required String firstName,
    required String emailAddress,
    required String password,
     required String phoneNumber,
      required String lastName
  })async {
    //show processing state
    emit(state.copyWith(signupStatus: SignupStatus.Processing));

    try{

      print("Got to try catch section");
      await signupRepository.signup(
        emailAddress: emailAddress,
        password: password,
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
      );
      // await signupRepository
      //     .signup(person:
      // Persons(emailAddress: emailAddress, fullName: fullName, balance: 5000 ));

      emit(state.copyWith(signupStatus: SignupStatus.Successful));

    }
   
    catch (e) {
      if (kDebugMode) {
        print("Got to error section");
      }
      emit(state.copyWith(signupStatus: SignupStatus.Error));
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
