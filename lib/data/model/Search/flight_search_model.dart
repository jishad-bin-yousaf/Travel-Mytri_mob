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
    String? minAmount,
  }) = _AvailableAirline;

  factory AvailableAirline.fromJson(Map<String, dynamic> json) => _$AvailableAirlineFromJson(json);
}

@freezed
class Apisearchresponse with _$Apisearchresponse {
  const factory Apisearchresponse({
    int? itin_id,
    String? providerCode,
    String? airlineName, //
    String? airlineCode,
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
    String? cabinBaggage,
    String? checkinBaggage,
    String? meal,
    String? seat,
    String? cancellation,
    String? dateChange,
  }) = _PricingBasic;

  factory PricingBasic.fromJson(Map<String, dynamic> json) => _$PricingBasicFromJson(json);
}

@freezed
class IRAirlineSearchResponse with _$IRAirlineSearchResponse {
  const factory IRAirlineSearchResponse({
    //individual Round Trip(Domestic)
    bool? status,
    String? responseMessage,
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
    List<Apisearchresponse>? objItinList,
    List<Apisearchresponse>? objItinListR,
  }) = _IRAirlineSearchResponse;

  factory IRAirlineSearchResponse.fromJson(Map<String, dynamic> json) => _$IRAirlineSearchResponseFromJson(json);
}

@freezed
class RAirlineSearchResponse with _$RAirlineSearchResponse {
  const factory RAirlineSearchResponse({
    //Combined Round trip(International)

    bool? status,
    String? responseMessage,
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
    Apisearchresponse? onwardDetails,
    Apisearchresponse? returnDetails,
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
