import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_buddy/models/login_data/login_data.dart';

import '../screens/login/store/login_screen_store.dart';

class ApiCallHandler {
  Future<String> getToken(
      {required String email, required String password}) async {
    try {
      print(email);
      print(password);
      await Future.delayed(const Duration(seconds: 2));
      final response = await http.post(
          Uri.parse('https://d8a2-49-34-190-50.ngrok.io/user/login'),
          body: {"email": email, "password": password});
      print(response);
      var responseData = jsonDecode(response.body);
      print(responseData);
      return responseData['data']['token'];
    } catch (e) {
      return Future.error(e);
    }
  }





  Future<String> updateCheckList(
      { required String id, required bool isChecked,required bookingId}) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'authorization': token.state.token!,
      };
      final response = await http.patch(
          Uri.parse(
            'https://d8a2-49-34-190-50.ngrok.io/booking/$bookingId',
          ),
          body: {"id": id, "isChecked":isChecked},
          headers: headers);
      print(response);
      var responseData = jsonDecode(response.body);
      print(responseData);
      return responseData['data']['token'];
    } catch (e) {
      return Future.error(e);
    }
  }
}
