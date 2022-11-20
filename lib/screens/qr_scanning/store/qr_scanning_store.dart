import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:states_rebuilder/scr/state_management/rm.dart';
import 'package:travel_buddy/models/check_screen_data/check_screen_data.dart';
import 'package:travel_buddy/models/ticket_data/ticket_data.dart';
import 'package:travel_buddy/screens/login/store/login_screen_store.dart';

import '../../../models/login_data/login_data.dart';

class QrScanningStore {
  //todo remove this and use actual api call
  Future<dynamic> getTicketDataFromQrToken(String id) async {
    print('SCANNED_QR_TOKEN');
    print('***************${id}');

    try {
      print('))))))))))))))))))))))))))))))))${token.state.token}');
      await Future.delayed(const Duration(seconds: 2));
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'authorization': token.state.token!,
      };
      final response = await http.get(
          Uri.parse(
            'https://d8a2-49-34-190-50.ngrok.io/booking/checkpoints/$id',
          ),
          headers: headers);
      print(response);
      print('================${response.body}');
      var responseData = jsonDecode(response.body);
      print('***************${responseData}');
      return responseData;
    } catch (e) {
      return Future.error(e);
    }
  }
}
