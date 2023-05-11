import 'package:freezed_annotation/freezed_annotation.dart';
part '../../gen/My Trip/flights.freezed.dart';
part '../../gen/My Trip/flights.g.dart';

@freezed
class AirlineTicketHistoryResponse with _$AirlineTicketHistoryResponse {
  const factory AirlineTicketHistoryResponse({
    bool? status,
    String? responseMessage,
    List<AirlineTicketHistory>? objAirlineTicketHistory,
    String? statusType,
  }) = _AirlineTicketHistoryResponse;

  factory AirlineTicketHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AirlineTicketHistoryResponseFromJson(json);
}

@freezed
class AirlineTicketHistory with _$AirlineTicketHistory {
  const factory AirlineTicketHistory({
    String? alhindPnr,
    String? airlinePnr,
    String? bookingType,
    String? airlineName,
    String? leadPassenger,
    String? origin,
    String? destination,
    DateTime? bookingDate,
    DateTime? departureDate,
    DateTime? arrivalDate,
    double? totalAmount,
    String? status,
    String? airlineCode,
    String? flightNo,
    String? fromCity,
    String? toCity,
    String? startTerminal,
    String? endTerminal,
  }) = _AirlineTicketHistory;

  factory AirlineTicketHistory.fromJson(Map<String, dynamic> json) =>
      _$AirlineTicketHistoryFromJson(json);
}
