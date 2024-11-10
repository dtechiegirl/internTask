import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository{
  static const String apiUrl = 'https://backend-l9vq.onrender.com/api/v1/user/login'; // Replace with your actual API URL
  Future<Map<String, dynamic>> login({required  emailAddress,  required String password}) async {
    try {
      
       final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': emailAddress,
        'password': password,
      }),
     
    );
     return json.decode(response.body);
    } catch (e) {
      print("the errro view is $e");
      throw e;
    }
  }
}



 // Future<Map<String, dynamic>> login({required  email,  required String password}) async {
  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: {'Content-Type': 'application/json'},
  //     body: json.encode({
  //       'email': email,
  //       'password': password,
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     return json.decode(response.body); // Return the response body as a Map
  //   } else {
  //     throw Exception('Failed to login');
  //   }
  // }