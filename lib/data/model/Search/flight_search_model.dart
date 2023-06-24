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
    String? departureDate,
    String? tripmode,
  }) = _Objsectorlist;

  factory Objsectorlist.fromJson(Map<String, dynamic> json) => _$ObjsectorlistFromJson(json);
}

@unfreezed
class AirlineSearchResponse with _$AirlineSearchResponse {
  factory AirlineSearchResponse({
    bool? status,
    bool? test,
    String? responseMessage,
    String? origin,
    String? destination,
    String? airlineClass,
    DateTime? departureDate,
    String? returnDate,
    num? adult,
    num? child,
    num? infant,
    List<LowestFare>? objlowfareList,
    double? minimumFare,
    double? maximumFare,
    List<AvailableAirline>? objAvlairlineList,
    List<ApiSearchResponse>? objItinList,
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

@unfreezed
class RAirlineSearchResponse with _$RAirlineSearchResponse {
  factory RAirlineSearchResponse({
    //Combined Round trip(International)

    bool? status,
    String? responseMessage,
    bool? test,
    String? airlineClass,
    String? origin,
    String? destination,
    DateTime? departureDate,
    DateTime? returnDate,
    int? adult,
    int? child,
    int? infant,
    double? minimumFare,
    double? maximumFare,
    List<AvailableAirline>? objAvlairlineList,
    List<RApisearchresponse>? objItinList,
  }) = _RAirlineSearchResponse;

  factory RAirlineSearchResponse.fromJson(Map<String, dynamic> json) => _$RAirlineSearchResponseFromJson(json);
}

@freezed
class RApisearchresponse with _$RApisearchresponse {
  const factory RApisearchresponse({
    int? itinId,
    int? fareId,
    String? providerCode,
    ApiSearchResponse? onwardDetails,
    ApiSearchResponse? returnDetails,
    double? amount,
    double? discount,
    double? netAmount,
    List<PricingBasic>? pricingList,
  }) = _RApisearchresponse;

  factory RApisearchresponse.fromJson(Map<String, dynamic> json) => _$RApisearchresponseFromJson(json);
}

@freezed
class Apisearchresponsedetails with _$Apisearchresponsedetails {
  const factory Apisearchresponsedetails({
    String? airlineCode,
    String? airlineName,
    String? flightDetails,
    String? source,
    String? destination,
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
    int? noofStop,
    String? segmentDetails,
  }) = _Apisearchresponsedetails;
  factory Apisearchresponsedetails.fromJson(Map<String, dynamic> json) => _$ApisearchresponsedetailsFromJson(json);
}

@freezed
class FlightDetailsResponse with _$FlightDetailsResponse {
  const factory FlightDetailsResponse({
    bool? status,
    String? responseMessage,
    FlightDetailsItin? objitin,
    int? adult,
    int? child,
    int? infant,
    double? adtBasic,
    double? adtTax,
    double? chdBasic,
    double? chdTax,
    double? infBasic,
    double? infTax,
    double? totalFare,
  }) = _FlightDetailsResponse;
  factory FlightDetailsResponse.fromJson(Map<String, dynamic> json) => _$FlightDetailsResponseFromJson(json);
}

@freezed
class FlightDetailsItin with _$FlightDetailsItin {
  const factory FlightDetailsItin({
    String? originCity,
    String? destinationCity,
    String? departureDate,
    List<FlightDetailsSegment>? objseglist,
    String? adultCheckinBaggage,
    String? adultCabinBaggage,
    String? childCheckinBaggage,
    String? childCabinBaggage,
    String? infantCheckinBaggage,
    String? infantCabinBaggage,
  }) = _FlightDetailsItin;
  factory FlightDetailsItin.fromJson(Map<String, dynamic> json) => _$FlightDetailsItinFromJson(json);
}

@freezed
class FlightDetailsSegment with _$FlightDetailsSegment {
  const factory FlightDetailsSegment({
    String? airlineCode,
    String? airlineName,
    String? airlineFlightClass,
    String? departureAirportCode,
    String? departureTime,
    String? departureDate,
    String? departureAirport,
    String? flightNumber,
    String? departureCity,
    String? arrivalAirportCode,
    String? arrivalTime,
    String? arrivalDate,
    String? arrivalAirport,
    String? arrivalCity,
    String? travelDuration,
    String? layoverTime,
  }) = _FlightDetailsSegment;
  factory FlightDetailsSegment.fromJson(Map<String, dynamic> json) => _$FlightDetailsSegmentFromJson(json);
}

@unfreezed
class PricingRequest with _$PricingRequest {
  factory PricingRequest({
    int? itinId,
    int? itinIdR,
    int? fareId,
    int? fareIdR,
    String? providerCode,
    String? providerCodeR,
  }) = _PricingRequest;

  factory PricingRequest.fromJson(Map<String, dynamic> json) => _$PricingRequestFromJson(json);
}

@unfreezed
class IRAirlineSearchResponse with _$IRAirlineSearchResponse {
  factory IRAirlineSearchResponse({
    bool? status,
    String? responseMessage,
    bool? testO,
    bool? testR,
    String? airlineClass,
    String? origin,
    String? destination,
    DateTime? departureDate,
    String? originR,
    String? destinationR,
    DateTime? returnDate,
    int? adult,
    int? child,
    int? infant,
    double? minimumFare,
    double? maximumFare,
    double? minimumFareR,
    double? maximumFareR,
    List<AvailableAirline>? objAvlairlineList,
    List<ApiSearchResponse>? objItinList,
    List<ApiSearchResponse>? objItinListR,
  }) = _IRAirlineSearchResponse;

  factory IRAirlineSearchResponse.fromJson(Map<String, dynamic> json) => _$IRAirlineSearchResponseFromJson(json);
}

@freezed
class AvailableAirline with _$AvailableAirline {
  const factory AvailableAirline({
    String? airlineCode,
    String? airlineName,
    double? minAmount,
    int? count,
  }) = _AvailableAirline;

  factory AvailableAirline.fromJson(Map<String, dynamic> json) => _$AvailableAirlineFromJson(json);
}

@unfreezed
class ApiSearchResponse with _$ApiSearchResponse {
  factory ApiSearchResponse({
    int? itinId,
    int? fareId,
    String? providerCode,
    String? airlineCode,
    String? airlineName,
    String? flightDetails,
    String? source,
    String? destination,
    String? departureDate,
    String? arrivalDate,
    String? departureTime,
    String? arrivalTime,
    String? duration,
    int? durationInMinutes,
    String? freeBaggage,
    String? refundable,
    String? sourceAirport,
    String? destinationAirport,
    int? noofSeat,
    double? amount,
    double? discount,
    double? netAmount,
    double? adultFare,
    int? noofStop,
    String? segmentDetails,
    String? codeshareAirlines,
    List<PricingBasic>? pricingList,
  }) = _ApiSearchResponse;

  factory ApiSearchResponse.fromJson(Map<String, dynamic> json) => _$ApiSearchResponseFromJson(json);
}

@freezed
class PricingBasic with _$PricingBasic {
  const factory PricingBasic({
    int? fareId,
    String? fareName,
    double? netAmount,
    double? discount,
    String? cabinBaggage,
    String? checkinBaggage,
    String? meal,
    String? seat,
    String? cancellation,
    String? dateChange,
  }) = _PricingBasic;

  factory PricingBasic.fromJson(Map<String, dynamic> json) => _$PricingBasicFromJson(json);
}

@unfreezed
class FlightDetailsRequest with _$FlightDetailsRequest {
  factory FlightDetailsRequest({
    int? itinId,
    int? fareId,
    String? providerCode,
  }) = _FlightDetailsRequest;

  factory FlightDetailsRequest.fromJson(Map<String, dynamic> json) => _$FlightDetailsRequestFromJson(json);
}

@unfreezed
class FlightDetailsRequestIR with _$FlightDetailsRequestIR {
  factory FlightDetailsRequestIR({
    int? itinId,
    int? itinIdR,
    int? fareId,
    int? fareIdR,
    String? providerCode,
    String? providerCodeR,
  }) = _FlightDetailsRequestIR;

  factory FlightDetailsRequestIR.fromJson(Map<String, dynamic> json) => _$FlightDetailsRequestIRFromJson(json);
}

@freezed
class FlightDetailsResponseIR with _$FlightDetailsResponseIR {
  const factory FlightDetailsResponseIR({
    bool? status,
    String? responseMessage,
    FlightDetailsItin? objitin,
    FlightDetailsItin? objitinR,
    int? adult,
    int? child,
    int? infant,
    double? adtBasic,
    double? adtTax,
    double? chdBasic,
    double? chdTax,
    double? infBasic,
    double? infTax,
    double? totalFare,
  }) = _FlightDetailsResponseIR;

  factory FlightDetailsResponseIR.fromJson(Map<String, dynamic> json) => _$FlightDetailsResponseIRFromJson(json);
}
