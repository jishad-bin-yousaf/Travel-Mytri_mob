import 'package:freezed_annotation/freezed_annotation.dart';
part '../../gen/My Trip/my_trips.freezed.dart';
part '../../gen/My Trip/my_trips.g.dart';

@freezed
class AirlineTicketHistoryResponse with _$AirlineTicketHistoryResponse {
  const factory AirlineTicketHistoryResponse({
    bool? status,
    String? responseMessage,
    List<AirlineTicketHistory>? objAirlineTicketHistory,
    String? statusType,
  }) = _AirlineTicketHistoryResponse;

  factory AirlineTicketHistoryResponse.fromJson(Map<String, dynamic> json) => _$AirlineTicketHistoryResponseFromJson(json);
}

@freezed
class AirlineTicketHistory with _$AirlineTicketHistory {
  const factory AirlineTicketHistory({
    int? ItinId,
    String? departureCity,
    String? arrivalCity,
    String? bookingType,
    String? bookingReferenceId,
    String? airlinePnr,
    double? TotalAmount,
    String? tripMode,
    List<AirlineTicketHistoryDetails>? objSegDetails,
    List<String>? objPaxDetails,
  }) = _AirlineTicketHistory;

  factory AirlineTicketHistory.fromJson(Map<String, dynamic> json) => _$AirlineTicketHistoryFromJson(json);
}

@freezed
class AirlineTicketHistoryDetails with _$AirlineTicketHistoryDetails {
  const factory AirlineTicketHistoryDetails({
    String? departureDate,
    String? departureAirportDetails,
    String? departureTerminal,
    String? arrivalDate,
    String? arrivalAirportDetails,
    String? arrivalTerminal,
    String? airlineCode,
    String? airlineName,
  }) = _AirlineTicketHistoryDetails;

  factory AirlineTicketHistoryDetails.fromJson(Map<String, dynamic> json) => _$AirlineTicketHistoryDetailsFromJson(json);
}
