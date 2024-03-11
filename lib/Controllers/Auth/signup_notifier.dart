// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/widgets.dart';

import '../../Customs/routes/navigations.dart';
import '../../Customs/screens/player_screens.dart';
import '../../Customs/widgets/loading_widget.dart';
import '../../Models/Auth/user.dart';
import '../../Services/Auth/signup_api.dart';
import '../../Views/Auth/login_screen.dart';

class SignupNotifier extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  get formKey => _formKey;

  final SignupApi _authApi = SignupApi(); // Assuming AuthApi is your API class
  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signup(BuildContext context) async {
    final String name = nameController.text.trim();
    final String email = emailController.text.trim();
    final String phone = phoneController.text.trim();
    final String password = passwordController.text.trim();

    // Show loading popup
    LoadingPopup.show(context, true);
    notifyListeners();
    await Future.delayed(const Duration(seconds: 5));
    try {
      final UserInfo userInfo =
          await _authApi.signup(name, email, phone, password);

      await saveUserInfo(userInfo);
      PlayerScreens.PLAYERHOME(context);
      LoadingPopup.show(context, false);
      notifyListeners();
    } catch (error) {
      print('Signup Failed: $error');
      LoadingPopup.show(context, false);
      notifyListeners();
      navigateToScreen(const LoginScreen(), context);
    }
  }

  Future<void> saveUserInfo(UserInfo userInfo) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString('login_user', jsonEncode(userInfo.toJson()));
  }
}
