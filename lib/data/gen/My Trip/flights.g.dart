// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/My Trip/flights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AirlineTicketHistoryResponse _$$_AirlineTicketHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AirlineTicketHistoryResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      objAirlineTicketHistory: (json['objAirlineTicketHistory']
              as List<dynamic>?)
          ?.map((e) => AirlineTicketHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusType: json['statusType'] as String?,
    );

Map<String, dynamic> _$$_AirlineTicketHistoryResponseToJson(
        _$_AirlineTicketHistoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'objAirlineTicketHistory': instance.objAirlineTicketHistory,
      'statusType': instance.statusType,
    };

_$_AirlineTicketHistory _$$_AirlineTicketHistoryFromJson(
        Map<String, dynamic> json) =>
    _$_AirlineTicketHistory(
      alhindPnr: json['alhindPnr'] as String?,
      airlinePnr: json['airlinePnr'] as String?,
      bookingType: json['bookingType'] as String?,
      airlineName: json['airlineName'] as String?,
      leadPassenger: json['leadPassenger'] as String?,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      bookingDate: json['bookingDate'] == null
          ? null
          : DateTime.parse(json['bookingDate'] as String),
      departureDate: json['departureDate'] == null
          ? null
          : DateTime.parse(json['departureDate'] as String),
      arrivalDate: json['arrivalDate'] == null
          ? null
          : DateTime.parse(json['arrivalDate'] as String),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      status: json['status'] as String?,
      airlineCode: json['airlineCode'] as String?,
      flightNo: json['flightNo'] as String?,
      fromCity: json['fromCity'] as String?,
      toCity: json['toCity'] as String?,
      startTerminal: json['startTerminal'] as String?,
      endTerminal: json['endTerminal'] as String?,
    );

Map<String, dynamic> _$$_AirlineTicketHistoryToJson(
        _$_AirlineTicketHistory instance) =>
    <String, dynamic>{
      'alhindPnr': instance.alhindPnr,
      'airlinePnr': instance.airlinePnr,
      'bookingType': instance.bookingType,
      'airlineName': instance.airlineName,
      'leadPassenger': instance.leadPassenger,
      'origin': instance.origin,
      'destination': instance.destination,
      'bookingDate': instance.bookingDate?.toIso8601String(),
      'departureDate': instance.departureDate?.toIso8601String(),
      'arrivalDate': instance.arrivalDate?.toIso8601String(),
      'totalAmount': instance.totalAmount,
      'status': instance.status,
      'airlineCode': instance.airlineCode,
      'flightNo': instance.flightNo,
      'fromCity': instance.fromCity,
      'toCity': instance.toCity,
      'startTerminal': instance.startTerminal,
      'endTerminal': instance.endTerminal,
    };
