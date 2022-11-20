import 'package:json_annotation/json_annotation.dart';
import 'package:travel_buddy/screens/check_list/check_list_screen.dart';

part 'check_screen_data.g.dart';

@JsonSerializable(includeIfNull: false)
class CheckListData {
  String? successCode;
  String? status;
  String? statusCode;
  String? description;
  dynamic data;

  CheckListData(
      {this.successCode,
      this.status,
      this.statusCode,
      this.description,
      this.data});

  factory CheckListData.fromJson(Map<String, dynamic> json) =>
      _$CheckListDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckListDataToJson(this);
}
