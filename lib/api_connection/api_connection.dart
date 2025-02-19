import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class ApiConnection {
  static const hostConnect = "http://10.1.110.130/api_cosmetic_store"; // Your API URL
  static const hostConnectUser = "$hostConnect/user";

  static const validationEmail = "$hostConnectUser/validate.php";
  static const signUp = "$hostConnectUser/signup.php";
  static const login = "$hostConnectUser/login.php";

  // Create a logger instance
  static final Logger _logger = Logger('ApiConnection');

  static Future<bool> signUpUser(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse(signUp),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: {
        'user_name': name,
        'user_email': email,
        'user_password': password,
      },
    );

    _logger.info("signUpUser Status Code: ${response.statusCode}");
    _logger.info("signUpUser Response: ${response.body}");

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return responseBody['success'] as bool;
    } else {
      throw Exception('Failed to sign up');
    }
  }
}

void main() async {
  // Configure the logger
  Logger.root.level = Level.ALL; // Set the logging level
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  try {
    // Example usage
    bool signUpSuccess = await ApiConnection.signUpUser('John Doe', 'john@example.com', 'password123');
    if (signUpSuccess) {
      print('Sign up successful');
    } else {
      print('Failed to sign up');
    }
  } catch (e) {
    print('Error-api: $e');
  }
}
