import 'package:freezed_annotation/freezed_annotation.dart';

part '../../gen/Search/flight_search_model.freezed.dart';
part '../../gen/Search/flight_search_model.g.dart';

@unfreezed
class FlightSearchReqModel with _$FlightSearchReqModel {
  factory FlightSearchReqModel({
    List<Objsectorlist>? objsectorlist,
    int? adult,
    int? child,
    int? infant,
    String? airlineClass,
    String? prefferedCarriers,
    String? prefferedProviders,
    String? fareType,
    bool? isdirect,
    String? traveltype,
  }) = _FlightSearchModel;

  factory FlightSearchReqModel.fromJson(Map<String, dynamic> json) => _$FlightSearchReqModelFromJson(json);
}

@unfreezed
class Objsectorlist with _$Objsectorlist {
  factory Objsectorlist({
    String? origin,
    String? origincountry,
    String? destination,
    String? destinationcountry,
    DateTime? departureDate,
    String? tripmode,
  }) = _Objsectorlist;

  factory Objsectorlist.fromJson(Map<String, dynamic> json) => _$ObjsectorlistFromJson(json);
}

@freezed
class AirlineSearchResponse with _$AirlineSearchResponse {
  const factory AirlineSearchResponse({
    bool? status,
    String? responseMessage,
    String? origin,
    String? destination,
    String? airlineClass,
    String? departureDate,
    String? returnDate,
    int? adult,
    int? child,
    int? infant,
    int? passengers,
    List<LowestFare>? objlowfareList,
    double? minimumFare,
    double? maximumFare,
    List<AvailableAirline>? objAvlairlineList,
    List<Apisearchresponse>? objItinList,
  }) = _AirlineSearchResponse;

  factory AirlineSearchResponse.fromJson(Map<String, dynamic> json) => _$AirlineSearchResponseFromJson(json);
}

@freezed
class LowestFare with _$LowestFare {
  const factory LowestFare({
    String? airlineName,
    String? amount,
    String? date,
  }) = _LowestFare;

  factory LowestFare.fromJson(Map<String, dynamic> json) => _$LowestFareFromJson(json);
}

@freezed
class AvailableAirline with _$AvailableAirline {
  const factory AvailableAirline({
    String? airlineCode,
    String? airlineName,
  }) = _AvailableAirline;

  factory AvailableAirline.fromJson(Map<String, dynamic> json) => _$AvailableAirlineFromJson(json);
}

@freezed
class Apisearchresponse with _$Apisearchresponse {
  const factory Apisearchresponse({
    int? itin_id,
    String? airlineName, //
    String? airlineCOde,
    String? flightDetails,
    String? source,
    String? destination,
    String? origin,
    String? departureDate,
    String? arrivalDate,
    String? departureTime,
    String? arrivalTime,
    String? duration,
    String? freeBaggage,
    String? refundable,
    String? sourceAirport,
    String? destinationAirport,
    int? noofSeat,
    double? amount,
    double? discount,
    double? netAmount,
    int? noofStop,
    String? segmentDetails,
    List<PricingBasic>? pricngList,
  }) = _Apisearchresponse;

  factory Apisearchresponse.fromJson(Map<String, dynamic> json) => _$ApisearchresponseFromJson(json);
}

@freezed
class PricingBasic with _$PricingBasic {
  const factory PricingBasic({
    int? fareId,
    String? fareName,
    double? netAmount,
    double? discount,
  }) = _PricingBasic;

  factory PricingBasic.fromJson(Map<String, dynamic> json) => _$PricingBasicFromJson(json);
}
