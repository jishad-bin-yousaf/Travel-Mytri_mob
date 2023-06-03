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
    DateTime? departureDate,
    String? returnDate,
    num? adult,
    num? child,
    num? infant,
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
    double? minAmount,
  }) = _AvailableAirline;

  factory AvailableAirline.fromJson(Map<String, dynamic> json) => _$AvailableAirlineFromJson(json);
}

@freezed
class Apisearchresponse with _$Apisearchresponse {
  const factory Apisearchresponse({
    int? itinId,
    String? providerCode,
    String? airlineName,
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
    List<PricingBasic>? pricingList,
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
    String? providerCode,
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

@freezed
class PricingResponse with _$PricingResponse {
  const factory PricingResponse({
    bool? status,
    String? responseMessage,
    List<PricingDetailsList>? objSegList,
    double? adultBasic,
    double? childBasic,
    double? infantBasic,
    List<TaxSplitup>? taxList,
    int? adult,
    int? child,
    int? infant,
    double? adultTotal,
    double? childTotal,
    double? infantTotal,
    double? discountAmount,
    double? finalAmount,
    List<PricingPaxlist>? objAdtPaxList,
    List<PricingPaxlist>? objChdPaxList,
    List<PricingPaxlist>? objInfPaxList,
  }) = _PricingResponse;

  factory PricingResponse.fromJson(Map<String, dynamic> json) => _$PricingResponseFromJson(json);
}

@freezed
class PricingPaxlist with _$PricingPaxlist {
  const factory PricingPaxlist({
    String? paxKey,
    List<PricingMealSegment>? objmealseglist,
    List<PricingBaggageSegment>? objbaggageseglist,
  }) = _PricingPaxlist;

  factory PricingPaxlist.fromJson(Map<String, dynamic> json) => _$PricingPaxlistFromJson(json);
}

@freezed
class TaxSplitup with _$TaxSplitup {
  const factory TaxSplitup({
    String? taxCode,
    double? amount,
  }) = _TaxSplitup;

  factory TaxSplitup.fromJson(Map<String, dynamic> json) => _$TaxSplitupFromJson(json);
}

@freezed
class PricingDetailsList with _$PricingDetailsList {
  const factory PricingDetailsList({
    String? airlineCode,
    String? airlineName,
    String? flightdetails,
    String? departureAirportCode,
    String? departureTime,
    String? departureDate,
    String? departureCity,
    String? departureAirport,
    String? arrivalAirportCode,
    String? arrivalAirport,
    String? arrivalTime,
    String? arrivalDate,
    String? arrivalCity,
    String? travelDuration,
    String? layoverTime,
    String? airlineFlightClass,
    String? cabinBaggage,
    int? noofStop,
  }) = _PricingDetailsList;

  factory PricingDetailsList.fromJson(Map<String, dynamic> json) => _$PricingDetailsListFromJson(json);
}

@freezed
class PricingMealSegment with _$PricingMealSegment {
  const factory PricingMealSegment({
    String? sectorCode,
    String? tripMode,
    List<MealSearchResult>? objmealList,
  }) = _PricingMealSegment;

  factory PricingMealSegment.fromJson(Map<String, dynamic> json) => _$PricingMealSegmentFromJson(json);
}

@freezed
class MealSearchResult with _$MealSearchResult {
  const factory MealSearchResult({
    String? mealUrl,
    String? code,
    String? name,
    double? amount,
  }) = _MealSearchResult;

  factory MealSearchResult.fromJson(Map<String, dynamic> json) => _$MealSearchResultFromJson(json);
}

@freezed
class PricingBaggageSegment with _$PricingBaggageSegment {
  const factory PricingBaggageSegment({
    String? sectorCode,
    String? tripMode,
    List<BaggageSearchResult>? objbaggageList,
  }) = _PricingBaggageSegment;

  factory PricingBaggageSegment.fromJson(Map<String, dynamic> json) => _$PricingBaggageSegmentFromJson(json);
}

@freezed
class BaggageSearchResult with _$BaggageSearchResult {
  const factory BaggageSearchResult({
    String? code,
    String? name,
    double? amount,
  }) = _BaggageSearchResult;

  factory BaggageSearchResult.fromJson(Map<String, dynamic> json) => _$BaggageSearchResultFromJson(json);
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
