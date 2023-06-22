import 'package:freezed_annotation/freezed_annotation.dart';

part '../../gen/Search/pricing_models.freezed.dart';
part '../../gen/Search/pricing_models.g.dart';

@unfreezed
class RepricingRequest with _$RepricingRequest {
  factory RepricingRequest({
    int? itinId,
    int? itinIdR,
    int? fareId,
    int? fareIdR,
    String? providerCode,
    String? providerCodeR,
    List<RePricingPaxlist>? objAdtPaxList,
    List<RePricingPaxlist>? objChdPaxList,
    List<RePricingPaxlist>? objInfPaxList,
  }) = _RepricingRequest;
  factory RepricingRequest.fromJson(Map<String, dynamic> json) => _$RepricingRequestFromJson(json);
}

@unfreezed
class RePricingPaxlist with _$RePricingPaxlist {
  factory RePricingPaxlist({
    String? paxKey,
    List<SSRMeal>? objMealList,
    List<SSRBaggage>? objBaggage,
    //  List<SSRSeat>? objSeatList,
  }) = _RePricingPaxlist;
  factory RePricingPaxlist.fromJson(Map<String, dynamic> json) => _$RePricingPaxlistFromJson(json);
}

@unfreezed
class SSRMeal with _$SSRMeal {
  factory SSRMeal({
    String? tripMode,
    String? segmentCode,
    String? key,
    double? amount,
    String? name,
  }) = _SSRMeal;
  factory SSRMeal.fromJson(Map<String, dynamic> json) => _$SSRMealFromJson(json);
}

@unfreezed
class SSRBaggage with _$SSRBaggage {
  factory SSRBaggage({
    String? tripMode,
    String? segmentCode,
    String? key,
    double? amount,
    String? name,
  }) = _SSRBaggage;
  factory SSRBaggage.fromJson(Map<String, dynamic> json) => _$SSRBaggageFromJson(json);
}

@unfreezed
class SSRSeat with _$SSRSeat {
  factory SSRSeat({
    String? tripMode,
    String? segmentCode,
    String? mealKey,
    double? amount,
    String? mealName,
  }) = _SSRSeat;
  factory SSRSeat.fromJson(Map<String, dynamic> json) => _$SSRSeatFromJson(json);
}

@freezed
class PricingResponse with _$PricingResponse {
  const factory PricingResponse({
    bool? status,
    String? responseMessage,
    int? itinId,
    int? itinIdR,
    int? fareId,
    int? fareIdR,
    String? providerCode,
    String? providerCodeR,
    int? adult,
    int? child,
    int? infant,
    ApiPricingResponse? objApiResponse,
  }) = _PricingResponse;

  factory PricingResponse.fromJson(Map<String, dynamic> json) => _$PricingResponseFromJson(json);
}

@freezed
class RepriceResponse with _$RepriceResponse {
  const factory RepriceResponse({
    bool? status,
    String? responseMessage,
    int? itinId,
    int? itinIdR,
    int? fareId,
    int? fareIdR,
    String? providerCode,
    String? providerCodeR,
    double? totalTax,
    double? totalResponseAmount,
    List<PricingDetailsList>? objSegList,
    double? adultBasic,
    double? childBasic,
    double? infantBasic,
    double? totalBasic,
    List<TaxSplitup>? taxList,
    int? adult,
    int? child,
    int? infant,
    double? adultTotal,
    double? childTotal,
    double? infantTotal,
    double? ssrTotal,
    double? discountAmount,
    double? finalAmount,
  }) = _RepriceResponse;

  factory RepriceResponse.fromJson(Map<String, dynamic> json) => _$RepriceResponseFromJson(json);
}

@freezed
class ApiPricingResponse with _$ApiPricingResponse {
  const factory ApiPricingResponse({
    double? adultBasic,
    double? childBasic,
    double? infantBasic,
    double? totalBasic,
    List<TaxSplitup>? taxList,
    List<PricingDetailsList>? objSegList,
    double? totalTax,
    double? totalResponseAmount,
    double? discountAmount,
    double? finalAmount,
    List<PricingPaxlist>? objAdtPaxList,
    List<PricingPaxlist>? objChdPaxList,
    List<PricingPaxlist>? objInfPaxList,
  }) = _ApiPricingResponse;

  factory ApiPricingResponse.fromJson(Map<String, dynamic> json) => _$ApiPricingResponseFromJson(json);
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
class BookingResponse with _$BookingResponse {
  const factory BookingResponse({
    bool? status,
    String? responseMessage,
    String? bookingReferenceId,
    String? bookingReferenceIdR,
    String? email,
    double? paidAmount,
    List<BookingSegmentDetails>? objSegmentList,
    List<BookingPaxlistRsp>? objPaxlist,
  }) = _BookingResponse;

  factory BookingResponse.fromJson(Map<String, dynamic> json) => _$BookingResponseFromJson(json);
}

@freezed
class BookingSegmentDetails with _$BookingSegmentDetails {
  const factory BookingSegmentDetails({
    String? airlineCode,
    String? airlineName,
    String? flightdetails,
    String? departureAirportCode,
    String? departureTime,
    String? departureDate,
    String? departureCity,
    String? departureAirport,
    String? arrivalAirportCode,
    String? arrivalTime,
    String? arrivalDate,
    String? arrivalCity,
    String? arrivalAirport,
    String? travelDuration,
    String? stop,
    String? airlineFlightClass,
    String? cabinBaggage,
  }) = _BookingSegmentDetails;

  factory BookingSegmentDetails.fromJson(Map<String, dynamic> json) => _$BookingSegmentDetailsFromJson(json);
}

@freezed
class BookingPaxlistRsp with _$BookingPaxlistRsp {
  const factory BookingPaxlistRsp({
    String? paxName,
    String? paxType,
  }) = _BookingPaxlistRsp;

  factory BookingPaxlistRsp.fromJson(Map<String, dynamic> json) => _$BookingPaxlistRspFromJson(json);
}

@unfreezed
class BookingRequest with _$BookingRequest {
  factory BookingRequest({
    int? itinId,
    int? fareId,
    String? providerCode,
    int? itinIdR,
    int? fareIdR,
    String? providerCodeR,
    String? contactNumber,
    String? alternateContactNumber,
    String? contactEmail,
    List<BookingPaxdetails>? objPaxList,
    BookingGstDetails? objGst,
  }) = _BookingRequest;

  factory BookingRequest.fromJson(Map<String, dynamic> json) => _$BookingRequestFromJson(json);
}

@unfreezed
class BookingPaxdetails with _$BookingPaxdetails {
  factory BookingPaxdetails({
    String? paxType,
    String? paxKey,
    String? title,
    String? firstName,
    String? lastName,
    String? documentNumber,
    String? nationality,
    String? dateofBirth,
    String? countryofIssue,
    String? dateOfExpiry,
    List<SSRMeal>? objMealList,
    List<SSRBaggage>? objBaggage,
    List<SSRSeat>? objSeatList,
  }) = _BookingPaxdetails;

  factory BookingPaxdetails.fromJson(Map<String, dynamic> json) => _$BookingPaxdetailsFromJson(json);
}

@unfreezed
class BookingGstDetails with _$BookingGstDetails {
  factory BookingGstDetails({
    String? gstNumber,
    String? companyName,
    String? email,
    String? mobile,
    String? address,
    String? city,
    int? pincode,
  }) = _BookingGstDetails;

  factory BookingGstDetails.fromJson(Map<String, dynamic> json) => _$BookingGstDetailsFromJson(json);
}
