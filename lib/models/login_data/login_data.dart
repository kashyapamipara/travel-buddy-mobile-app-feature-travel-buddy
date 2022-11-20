import 'package:json_annotation/json_annotation.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

part 'login_data.g.dart';

final token = RM.inject<LoginData>(
  () => LoginData(),
  sideEffects: SideEffects.onAll(
    onError: (error, _) => {
      print(error),
    },
    onData: (data) => {},
    onWaiting: () => {},
  ),
);

@JsonSerializable(includeIfNull: false)
class LoginData {
  final String? token;

  LoginData({
    this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
