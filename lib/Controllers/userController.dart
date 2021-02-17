import 'package:login_app/models/user_model.dart';
import 'package:login_app/services/user_service.dart';

class UserController {
  UserService userService = UserService();

  Future<UserModel> getUser(String uid) async {
    return userService.getUser(uid);
  }
}
