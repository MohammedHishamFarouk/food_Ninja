import 'package:food_ninja/core/api/end_points.dart';

class LoginModel {
  final String accessToken;
  final String refreshToken;

  LoginModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      accessToken: jsonData[ApiKey.accessToken],
      refreshToken: jsonData[ApiKey.refreshToken],
    );
  }
}
