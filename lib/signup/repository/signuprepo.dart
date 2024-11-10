import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupRepository {
  static const String apiUrl =
      'https://backend-l9vq.onrender.com/api/v1/user/signup'; // Replace with your actual API URL
  Future<Map<String, dynamic>> signup(
      {required emailAddress,
      required String password,
      required String phoneNumber,
      required String firstName,
      required String lastName}) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': emailAddress,
          'password': password,
          'phoneNumber': phoneNumber,
          'firstName': firstName,
          'lastName': lastName
        }),
      );
      return json.decode(response.body);
    } catch (e) {
      print("the errro view is $e");
      throw e;
    }
  }
}
