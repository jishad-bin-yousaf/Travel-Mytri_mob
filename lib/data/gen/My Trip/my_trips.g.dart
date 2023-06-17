// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/My Trip/my_trips.dart';

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
      ItinId: json['ItinId'] as int?,
      departureCity: json['departureCity'] as String?,
      arrivalCity: json['arrivalCity'] as String?,
      bookingType: json['bookingType'] as String?,
      bookingReferenceId: json['bookingReferenceId'] as String?,
      airlinePnr: json['airlinePnr'] as String?,
      TotalAmount: (json['TotalAmount'] as num?)?.toDouble(),
      objSegDetails: (json['objSegDetails'] as List<dynamic>?)
          ?.map((e) =>
              AirlineTicketHistoryDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      objPaxDetails: (json['objPaxDetails'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AirlineTicketHistoryToJson(
        _$_AirlineTicketHistory instance) =>
    <String, dynamic>{
      'ItinId': instance.ItinId,
      'departureCity': instance.departureCity,
      'arrivalCity': instance.arrivalCity,
      'bookingType': instance.bookingType,
      'bookingReferenceId': instance.bookingReferenceId,
      'airlinePnr': instance.airlinePnr,
      'TotalAmount': instance.TotalAmount,
      'objSegDetails': instance.objSegDetails,
      'objPaxDetails': instance.objPaxDetails,
    };

_$_AirlineTicketHistoryDetails _$$_AirlineTicketHistoryDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_AirlineTicketHistoryDetails(
      departureDate: json['departureDate'] as String?,
      departureAirportDetails: json['departureAirportDetails'] as String?,
      departureTerminal: json['departureTerminal'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      arrivalAirportDetails: json['arrivalAirportDetails'] as String?,
      arrivalTerminal: json['arrivalTerminal'] as String?,
      airlineCode: json['airlineCode'] as String?,
      airlineName: json['airlineName'] as String?,
    );

Map<String, dynamic> _$$_AirlineTicketHistoryDetailsToJson(
        _$_AirlineTicketHistoryDetails instance) =>
    <String, dynamic>{
      'departureDate': instance.departureDate,
      'departureAirportDetails': instance.departureAirportDetails,
      'departureTerminal': instance.departureTerminal,
      'arrivalDate': instance.arrivalDate,
      'arrivalAirportDetails': instance.arrivalAirportDetails,
      'arrivalTerminal': instance.arrivalTerminal,
      'airlineCode': instance.airlineCode,
      'airlineName': instance.airlineName,
    };
