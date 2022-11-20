import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:travel_buddy/models/login_data/login_data.dart';
import 'package:travel_buddy/services/api_call_handler.dart';

class LoginScreenRepository {
  Future<void> loginUser(
      {required String email, required String password}) async {
    try {
      print('helooooo');
      final response =
          await ApiCallHandler().getToken(email: email, password: password);
      print(response);
      token.setState(
        (s) => LoginData(token: response),
      );
      token.notify();
      print('#############${token.state.token}');
    } catch (e) {
      return Future.error('Error while login');
    }
  }
}
