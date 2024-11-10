import 'package:equatable/equatable.dart';

enum SignupStatus { Initial, Processing, Successful, Error }

class SignupState extends Equatable {
  SignupState({
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.emailAddress,
    required this.password,
    this.signupStatus = SignupStatus.Initial,
  });

  static SignupState empty = SignupState(
    fullName: "",
    emailAddress: "",
    password: "",
  
    phoneNumber: '',
    firstName: '',
    lastName: '',
    signupStatus: SignupStatus.Initial,
  );

  final String fullName;
  final String emailAddress;
  final String password;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final SignupStatus signupStatus;

  @override
  List<Object?> get props => [
        fullName,
        emailAddress,
        password,
        firstName,
        lastName,
        phoneNumber,
        signupStatus
      ];

  SignupState copyWith({
    String? fullName,
    String? emailAddress,
    String? password,
    String? firstName,
    String? phoneNumber,
    String? lastName,
    SignupStatus? signupStatus,
  }) {
    return SignupState(
      fullName: fullName ?? this.fullName,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      
      phoneNumber: phoneNumber ?? this.phoneNumber,
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      signupStatus: signupStatus ?? this.signupStatus,
    );
  }
}
