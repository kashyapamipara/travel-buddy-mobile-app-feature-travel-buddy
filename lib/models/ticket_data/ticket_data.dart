import 'package:json_annotation/json_annotation.dart';

part 'ticket_data.g.dart';

@JsonSerializable(includeIfNull: false)
class TicketData {
  final int? ticketNumber;
  final String? dateTime;
  final String? mobileNumber;
  final int? kids;
  final int? adults;
  final String? transactionId;
  final int? amount;
  final String? place;
  final bool? isValid;
  final String? invalidMessage;

  TicketData({
    this.ticketNumber,
    this.mobileNumber,
    this.kids,
    this.adults,
    this.transactionId,
    this.amount,
    this.place,
    this.isValid,
    this.invalidMessage,
    this.dateTime,
  });

  factory TicketData.fromJson(Map<String, dynamic> json) =>
      _$TicketDataFromJson(json);

  Map<String, dynamic> toJson() => _$TicketDataToJson(this);
}
