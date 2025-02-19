import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.5.195/api_cosmetic_store/user/login.php'),
      body: {
        'user_email': email,
        'user_password': password,
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData['success'];
    } else {
      return false;
    }
  }
}
