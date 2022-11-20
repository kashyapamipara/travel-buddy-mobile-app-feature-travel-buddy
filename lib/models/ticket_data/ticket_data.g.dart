// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketData _$TicketDataFromJson(Map<String, dynamic> json) => TicketData(
      ticketNumber: json['ticketNumber'] as int?,
      mobileNumber: json['mobileNumber'] as String?,
      kids: json['kids'] as int?,
      adults: json['adults'] as int?,
      transactionId: json['transactionId'] as String?,
      amount: json['amount'] as int?,
      place: json['place'] as String?,
      isValid: json['isValid'] as bool?,
      invalidMessage: json['invalidMessage'] as String?,
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$TicketDataToJson(TicketData instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ticketNumber', instance.ticketNumber);
  writeNotNull('dateTime', instance.dateTime);
  writeNotNull('mobileNumber', instance.mobileNumber);
  writeNotNull('kids', instance.kids);
  writeNotNull('adults', instance.adults);
  writeNotNull('transactionId', instance.transactionId);
  writeNotNull('amount', instance.amount);
  writeNotNull('place', instance.place);
  writeNotNull('isValid', instance.isValid);
  writeNotNull('invalidMessage', instance.invalidMessage);
  return val;
}
