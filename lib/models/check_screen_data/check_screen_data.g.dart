// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_screen_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckListData _$CheckListDataFromJson(Map<String, dynamic> json) =>
    CheckListData(
      successCode: json['successCode'] as String?,
      status: json['status'] as String?,
      description: json['description'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$CheckListDataToJson(CheckListData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('successCode', instance.successCode);
  writeNotNull('status', instance.status);
  writeNotNull('description', instance.description);
  writeNotNull('data', instance.data);
  return val;
}
