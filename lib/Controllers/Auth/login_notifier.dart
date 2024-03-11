// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../Customs/screens/player_screens.dart';
import '../../Customs/widgets/loading_widget.dart';
import '../../Models/Auth/user.dart';
import '../../Services/Auth/login_api.dart';

class LoginNotifier extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  get formKey => _formKey;

  final LoginApi _authApi = LoginApi(); // Assuming AuthApi is your API class
  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    // Show loading popup
    LoadingPopup.show(context, true);
    notifyListeners();
    await Future.delayed(const Duration(seconds: 5));
    try {
      final UserInfo userInfo = await _authApi.login(email, password);

      await saveUserInfo(userInfo);
      PlayerScreens.PLAYERHOME(context);
      LoadingPopup.show(context, false);
      notifyListeners();
    } catch (error) {
      LoadingPopup.show(context, false);
      notifyListeners();
      print('Login Failed: $error');
      PlayerScreens.PLAYERHOME(context);
    }
  }

  Future<void> saveUserInfo(UserInfo userInfo) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('login_user', jsonEncode(userInfo.toJson()));
  }
}
