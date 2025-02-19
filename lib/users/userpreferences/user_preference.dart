import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


class User {
  int user_id;
  String user_name;
  String user_email;
  String user_password;

  User({
    required this.user_id,
    required this.user_name,
    required this.user_email,
    required this.user_password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_id: json['user_id'],
      user_name: json['user_name'],
      user_email: json['user_email'],
      user_password: json['user_password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id.toString(),
      'user_name': user_name,
      'user_email': user_email,
      'user_password': user_password,
    };
  }
}

class UserPreferences {
  static const _userKey = 'user';

  Future<void> saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userData = json.encode(user.toJson());
    await prefs.setString(_userKey, userData);
  }

  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString(_userKey);

    if (userData != null) {
      Map<String, dynamic> userMap = json.decode(userData);
      return User.fromJson(userMap);
    }

    return null;
  }

  Future<void> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }
}
