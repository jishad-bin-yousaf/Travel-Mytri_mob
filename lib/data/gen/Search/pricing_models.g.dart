// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/Search/pricing_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepricingRequest _$$_RepricingRequestFromJson(Map<String, dynamic> json) =>
    _$_RepricingRequest(
      itinId: json['itinId'] as int?,
      itinIdR: json['itinIdR'] as int?,
      fareId: json['fareId'] as int?,
      fareIdR: json['fareIdR'] as int?,
      providerCode: json['providerCode'] as String?,
      providerCodeR: json['providerCodeR'] as String?,
      objAdtPaxList: (json['objAdtPaxList'] as List<dynamic>?)
          ?.map((e) => RePricingPaxlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      objChdPaxList: (json['objChdPaxList'] as List<dynamic>?)
          ?.map((e) => RePricingPaxlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      objInfPaxList: (json['objInfPaxList'] as List<dynamic>?)
          ?.map((e) => RePricingPaxlist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RepricingRequestToJson(_$_RepricingRequest instance) =>
    <String, dynamic>{
      'itinId': instance.itinId,
      'itinIdR': instance.itinIdR,
      'fareId': instance.fareId,
      'fareIdR': instance.fareIdR,
      'providerCode': instance.providerCode,
      'providerCodeR': instance.providerCodeR,
      'objAdtPaxList': instance.objAdtPaxList,
      'objChdPaxList': instance.objChdPaxList,
      'objInfPaxList': instance.objInfPaxList,
    };

_$_RePricingPaxlist _$$_RePricingPaxlistFromJson(Map<String, dynamic> json) =>
    _$_RePricingPaxlist(
      paxKey: json['paxKey'] as String?,
      objMealList: (json['objMealList'] as List<dynamic>?)
          ?.map((e) => SSRMeal.fromJson(e as Map<String, dynamic>))
          .toList(),
      objBaggage: (json['objBaggage'] as List<dynamic>?)
          ?.map((e) => SSRBaggage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RePricingPaxlistToJson(_$_RePricingPaxlist instance) =>
    <String, dynamic>{
      'paxKey': instance.paxKey,
      'objMealList': instance.objMealList,
      'objBaggage': instance.objBaggage,
    };

_$_SSRMeal _$$_SSRMealFromJson(Map<String, dynamic> json) => _$_SSRMeal(
      tripMode: json['tripMode'] as String?,
      segmentCode: json['segmentCode'] as String?,
      key: json['key'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_SSRMealToJson(_$_SSRMeal instance) =>
    <String, dynamic>{
      'tripMode': instance.tripMode,
      'segmentCode': instance.segmentCode,
      'key': instance.key,
      'amount': instance.amount,
      'name': instance.name,
    };

_$_SSRBaggage _$$_SSRBaggageFromJson(Map<String, dynamic> json) =>
    _$_SSRBaggage(
      tripMode: json['tripMode'] as String?,
      segmentCode: json['segmentCode'] as String?,
      key: json['key'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_SSRBaggageToJson(_$_SSRBaggage instance) =>
    <String, dynamic>{
      'tripMode': instance.tripMode,
      'segmentCode': instance.segmentCode,
      'key': instance.key,
      'amount': instance.amount,
      'name': instance.name,
    };

_$_SSRSeat _$$_SSRSeatFromJson(Map<String, dynamic> json) => _$_SSRSeat(
      tripMode: json['tripMode'] as String?,
      segmentCode: json['segmentCode'] as String?,
      mealKey: json['mealKey'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      mealName: json['mealName'] as String?,
    );

Map<String, dynamic> _$$_SSRSeatToJson(_$_SSRSeat instance) =>
    <String, dynamic>{
      'tripMode': instance.tripMode,
      'segmentCode': instance.segmentCode,
      'mealKey': instance.mealKey,
      'amount': instance.amount,
      'mealName': instance.mealName,
    };

_$_PricingResponse _$$_PricingResponseFromJson(Map<String, dynamic> json) =>
    _$_PricingResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      itinId: json['itinId'] as int?,
      itinIdR: json['itinIdR'] as int?,
      fareId: json['fareId'] as int?,
      fareIdR: json['fareIdR'] as int?,
      providerCode: json['providerCode'] as String?,
      providerCodeR: json['providerCodeR'] as String?,
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      objApiResponse: json['objApiResponse'] == null
          ? null
          : ApiPricingResponse.fromJson(
              json['objApiResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PricingResponseToJson(_$_PricingResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'itinId': instance.itinId,
      'itinIdR': instance.itinIdR,
      'fareId': instance.fareId,
      'fareIdR': instance.fareIdR,
      'providerCode': instance.providerCode,
      'providerCodeR': instance.providerCodeR,
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'objApiResponse': instance.objApiResponse,
    };

_$_RepriceResponse _$$_RepriceResponseFromJson(Map<String, dynamic> json) =>
    _$_RepriceResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      itinId: json['itinId'] as int?,
      itinIdR: json['itinIdR'] as int?,
      fareId: json['fareId'] as int?,
      fareIdR: json['fareIdR'] as int?,
      providerCode: json['providerCode'] as String?,
      providerCodeR: json['providerCodeR'] as String?,
      totalTax: (json['totalTax'] as num?)?.toDouble(),
      totalResponseAmount: (json['totalResponseAmount'] as num?)?.toDouble(),
      objSegList: (json['objSegList'] as List<dynamic>?)
          ?.map((e) => PricingDetailsList.fromJson(e as Map<String, dynamic>))
          .toList(),
      adultBasic: (json['adultBasic'] as num?)?.toDouble(),
      childBasic: (json['childBasic'] as num?)?.toDouble(),
      infantBasic: (json['infantBasic'] as num?)?.toDouble(),
      totalBasic: (json['totalBasic'] as num?)?.toDouble(),
      taxList: (json['taxList'] as List<dynamic>?)
          ?.map((e) => TaxSplitup.fromJson(e as Map<String, dynamic>))
          .toList(),
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      adultTotal: (json['adultTotal'] as num?)?.toDouble(),
      childTotal: (json['childTotal'] as num?)?.toDouble(),
      infantTotal: (json['infantTotal'] as num?)?.toDouble(),
      ssrTotal: (json['ssrTotal'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      finalAmount: (json['finalAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_RepriceResponseToJson(_$_RepriceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'itinId': instance.itinId,
      'itinIdR': instance.itinIdR,
      'fareId': instance.fareId,
      'fareIdR': instance.fareIdR,
      'providerCode': instance.providerCode,
      'providerCodeR': instance.providerCodeR,
      'totalTax': instance.totalTax,
      'totalResponseAmount': instance.totalResponseAmount,
      'objSegList': instance.objSegList,
      'adultBasic': instance.adultBasic,
      'childBasic': instance.childBasic,
      'infantBasic': instance.infantBasic,
      'totalBasic': instance.totalBasic,
      'taxList': instance.taxList,
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'adultTotal': instance.adultTotal,
      'childTotal': instance.childTotal,
      'infantTotal': instance.infantTotal,
      'ssrTotal': instance.ssrTotal,
      'discountAmount': instance.discountAmount,
      'finalAmount': instance.finalAmount,
    };

_$_ApiPricingResponse _$$_ApiPricingResponseFromJson(
        Map<String, dynamic> json) =>
    _$_ApiPricingResponse(
      adultBasic: (json['adultBasic'] as num?)?.toDouble(),
      childBasic: (json['childBasic'] as num?)?.toDouble(),
      infantBasic: (json['infantBasic'] as num?)?.toDouble(),
      totalBasic: (json['totalBasic'] as num?)?.toDouble(),
      taxList: (json['taxList'] as List<dynamic>?)
          ?.map((e) => TaxSplitup.fromJson(e as Map<String, dynamic>))
          .toList(),
      objSegList: (json['objSegList'] as List<dynamic>?)
          ?.map((e) => PricingDetailsList.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalTax: (json['totalTax'] as num?)?.toDouble(),
      totalResponseAmount: (json['totalResponseAmount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      finalAmount: (json['finalAmount'] as num?)?.toDouble(),
      objAdtPaxList: (json['objAdtPaxList'] as List<dynamic>?)
          ?.map((e) => PricingPaxlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      objChdPaxList: (json['objChdPaxList'] as List<dynamic>?)
          ?.map((e) => PricingPaxlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      objInfPaxList: (json['objInfPaxList'] as List<dynamic>?)
          ?.map((e) => PricingPaxlist.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ApiPricingResponseToJson(
        _$_ApiPricingResponse instance) =>
    <String, dynamic>{
      'adultBasic': instance.adultBasic,
      'childBasic': instance.childBasic,
      'infantBasic': instance.infantBasic,
      'totalBasic': instance.totalBasic,
      'taxList': instance.taxList,
      'objSegList': instance.objSegList,
      'totalTax': instance.totalTax,
      'totalResponseAmount': instance.totalResponseAmount,
      'discountAmount': instance.discountAmount,
      'finalAmount': instance.finalAmount,
      'objAdtPaxList': instance.objAdtPaxList,
      'objChdPaxList': instance.objChdPaxList,
      'objInfPaxList': instance.objInfPaxList,
    };

_$_PricingPaxlist _$$_PricingPaxlistFromJson(Map<String, dynamic> json) =>
    _$_PricingPaxlist(
      paxKey: json['paxKey'] as String?,
      objmealseglist: (json['objmealseglist'] as List<dynamic>?)
          ?.map((e) => PricingMealSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      objbaggageseglist: (json['objbaggageseglist'] as List<dynamic>?)
          ?.map(
              (e) => PricingBaggageSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PricingPaxlistToJson(_$_PricingPaxlist instance) =>
    <String, dynamic>{
      'paxKey': instance.paxKey,
      'objmealseglist': instance.objmealseglist,
      'objbaggageseglist': instance.objbaggageseglist,
    };

_$_TaxSplitup _$$_TaxSplitupFromJson(Map<String, dynamic> json) =>
    _$_TaxSplitup(
      taxCode: json['taxCode'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_TaxSplitupToJson(_$_TaxSplitup instance) =>
    <String, dynamic>{
      'taxCode': instance.taxCode,
      'amount': instance.amount,
    };

_$_PricingDetailsList _$$_PricingDetailsListFromJson(
        Map<String, dynamic> json) =>
    _$_PricingDetailsList(
      airlineCode: json['airlineCode'] as String?,
      airlineName: json['airlineName'] as String?,
      flightdetails: json['flightdetails'] as String?,
      departureAirportCode: json['departureAirportCode'] as String?,
      departureTime: json['departureTime'] as String?,
      departureDate: json['departureDate'] as String?,
      departureCity: json['departureCity'] as String?,
      departureAirport: json['departureAirport'] as String?,
      arrivalAirportCode: json['arrivalAirportCode'] as String?,
      arrivalAirport: json['arrivalAirport'] as String?,
      arrivalTime: json['arrivalTime'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      arrivalCity: json['arrivalCity'] as String?,
      travelDuration: json['travelDuration'] as String?,
      layoverTime: json['layoverTime'] as String?,
      airlineFlightClass: json['airlineFlightClass'] as String?,
      cabinBaggage: json['cabinBaggage'] as String?,
      noofStop: json['noofStop'] as int?,
    );

Map<String, dynamic> _$$_PricingDetailsListToJson(
        _$_PricingDetailsList instance) =>
    <String, dynamic>{
      'airlineCode': instance.airlineCode,
      'airlineName': instance.airlineName,
      'flightdetails': instance.flightdetails,
      'departureAirportCode': instance.departureAirportCode,
      'departureTime': instance.departureTime,
      'departureDate': instance.departureDate,
      'departureCity': instance.departureCity,
      'departureAirport': instance.departureAirport,
      'arrivalAirportCode': instance.arrivalAirportCode,
      'arrivalAirport': instance.arrivalAirport,
      'arrivalTime': instance.arrivalTime,
      'arrivalDate': instance.arrivalDate,
      'arrivalCity': instance.arrivalCity,
      'travelDuration': instance.travelDuration,
      'layoverTime': instance.layoverTime,
      'airlineFlightClass': instance.airlineFlightClass,
      'cabinBaggage': instance.cabinBaggage,
      'noofStop': instance.noofStop,
    };

_$_PricingMealSegment _$$_PricingMealSegmentFromJson(
        Map<String, dynamic> json) =>
    _$_PricingMealSegment(
      sectorCode: json['sectorCode'] as String?,
      tripMode: json['tripMode'] as String?,
      objmealList: (json['objmealList'] as List<dynamic>?)
          ?.map((e) => MealSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PricingMealSegmentToJson(
        _$_PricingMealSegment instance) =>
    <String, dynamic>{
      'sectorCode': instance.sectorCode,
      'tripMode': instance.tripMode,
      'objmealList': instance.objmealList,
    };

_$_MealSearchResult _$$_MealSearchResultFromJson(Map<String, dynamic> json) =>
    _$_MealSearchResult(
      mealUrl: json['mealUrl'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MealSearchResultToJson(_$_MealSearchResult instance) =>
    <String, dynamic>{
      'mealUrl': instance.mealUrl,
      'code': instance.code,
      'name': instance.name,
      'amount': instance.amount,
    };

_$_PricingBaggageSegment _$$_PricingBaggageSegmentFromJson(
        Map<String, dynamic> json) =>
    _$_PricingBaggageSegment(
      sectorCode: json['sectorCode'] as String?,
      tripMode: json['tripMode'] as String?,
      objbaggageList: (json['objbaggageList'] as List<dynamic>?)
          ?.map((e) => BaggageSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PricingBaggageSegmentToJson(
        _$_PricingBaggageSegment instance) =>
    <String, dynamic>{
      'sectorCode': instance.sectorCode,
      'tripMode': instance.tripMode,
      'objbaggageList': instance.objbaggageList,
    };

_$_BaggageSearchResult _$$_BaggageSearchResultFromJson(
        Map<String, dynamic> json) =>
    _$_BaggageSearchResult(
      code: json['code'] as String?,
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_BaggageSearchResultToJson(
        _$_BaggageSearchResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'amount': instance.amount,
    };

_$_BookingResponse _$$_BookingResponseFromJson(Map<String, dynamic> json) =>
    _$_BookingResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      bookingReferenceId: json['bookingReferenceId'] as String?,
      bookingReferenceIdR: json['bookingReferenceIdR'] as String?,
      email: json['email'] as String?,
      paidAmount: (json['paidAmount'] as num?)?.toDouble(),
      objSegmentList: (json['objSegmentList'] as List<dynamic>?)
          ?.map(
              (e) => BookingSegmentDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      objPaxlist: (json['objPaxlist'] as List<dynamic>?)
          ?.map((e) => BookingPaxlistRsp.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookingResponseToJson(_$_BookingResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'bookingReferenceId': instance.bookingReferenceId,
      'bookingReferenceIdR': instance.bookingReferenceIdR,
      'email': instance.email,
      'paidAmount': instance.paidAmount,
      'objSegmentList': instance.objSegmentList,
      'objPaxlist': instance.objPaxlist,
    };

_$_BookingSegmentDetails _$$_BookingSegmentDetailsFromJson(
        Map<String, dynamic> json) =>
    _$_BookingSegmentDetails(
      airlineCode: json['airlineCode'] as String?,
      airlineName: json['airlineName'] as String?,
      flightdetails: json['flightdetails'] as String?,
      departureAirportCode: json['departureAirportCode'] as String?,
      departureTime: json['departureTime'] as String?,
      departureDate: json['departureDate'] as String?,
      departureCity: json['departureCity'] as String?,
      departureAirport: json['departureAirport'] as String?,
      arrivalAirportCode: json['arrivalAirportCode'] as String?,
      arrivalTime: json['arrivalTime'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      arrivalCity: json['arrivalCity'] as String?,
      arrivalAirport: json['arrivalAirport'] as String?,
      travelDuration: json['travelDuration'] as String?,
      stop: json['stop'] as String?,
      airlineFlightClass: json['airlineFlightClass'] as String?,
      cabinBaggage: json['cabinBaggage'] as String?,
    );

Map<String, dynamic> _$$_BookingSegmentDetailsToJson(
        _$_BookingSegmentDetails instance) =>
    <String, dynamic>{
      'airlineCode': instance.airlineCode,
      'airlineName': instance.airlineName,
      'flightdetails': instance.flightdetails,
      'departureAirportCode': instance.departureAirportCode,
      'departureTime': instance.departureTime,
      'departureDate': instance.departureDate,
      'departureCity': instance.departureCity,
      'departureAirport': instance.departureAirport,
      'arrivalAirportCode': instance.arrivalAirportCode,
      'arrivalTime': instance.arrivalTime,
      'arrivalDate': instance.arrivalDate,
      'arrivalCity': instance.arrivalCity,
      'arrivalAirport': instance.arrivalAirport,
      'travelDuration': instance.travelDuration,
      'stop': instance.stop,
      'airlineFlightClass': instance.airlineFlightClass,
      'cabinBaggage': instance.cabinBaggage,
    };

_$_BookingPaxlistRsp _$$_BookingPaxlistRspFromJson(Map<String, dynamic> json) =>
    _$_BookingPaxlistRsp(
      paxName: json['paxName'] as String?,
      paxType: json['paxType'] as String?,
    );

Map<String, dynamic> _$$_BookingPaxlistRspToJson(
        _$_BookingPaxlistRsp instance) =>
    <String, dynamic>{
      'paxName': instance.paxName,
      'paxType': instance.paxType,
    };

_$_BookingRequest _$$_BookingRequestFromJson(Map<String, dynamic> json) =>
    _$_BookingRequest(
      itinId: json['itinId'] as int?,
      fareId: json['fareId'] as int?,
      providerCode: json['providerCode'] as String?,
      itinIdR: json['itinIdR'] as int?,
      fareIdR: json['fareIdR'] as int?,
      providerCodeR: json['providerCodeR'] as String?,
      contactNumber: json['contactNumber'] as String?,
      alternateContactNumber: json['alternateContactNumber'] as String?,
      contactEmail: json['contactEmail'] as String?,
      objPaxList: (json['objPaxList'] as List<dynamic>?)
          ?.map((e) => BookingPaxdetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      objGst: json['objGst'] == null
          ? null
          : BookingGstDetails.fromJson(json['objGst'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookingRequestToJson(_$_BookingRequest instance) =>
    <String, dynamic>{
      'itinId': instance.itinId,
      'fareId': instance.fareId,
      'providerCode': instance.providerCode,
      'itinIdR': instance.itinIdR,
      'fareIdR': instance.fareIdR,
      'providerCodeR': instance.providerCodeR,
      'contactNumber': instance.contactNumber,
      'alternateContactNumber': instance.alternateContactNumber,
      'contactEmail': instance.contactEmail,
      'objPaxList': instance.objPaxList,
      'objGst': instance.objGst,
    };

_$_BookingPaxdetails _$$_BookingPaxdetailsFromJson(Map<String, dynamic> json) =>
    _$_BookingPaxdetails(
      paxType: json['paxType'] as String?,
      paxKey: json['paxKey'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      documentNumber: json['documentNumber'] as String?,
      nationality: json['nationality'] as String?,
      dateofBirth: json['dateofBirth'] as String?,
      countryofIssue: json['countryofIssue'] as String?,
      dateOfExpiry: json['dateOfExpiry'] as String?,
      objMealList: (json['objMealList'] as List<dynamic>?)
          ?.map((e) => SSRMeal.fromJson(e as Map<String, dynamic>))
          .toList(),
      objBaggage: (json['objBaggage'] as List<dynamic>?)
          ?.map((e) => SSRBaggage.fromJson(e as Map<String, dynamic>))
          .toList(),
      objSeatList: (json['objSeatList'] as List<dynamic>?)
          ?.map((e) => SSRSeat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookingPaxdetailsToJson(
        _$_BookingPaxdetails instance) =>
    <String, dynamic>{
      'paxType': instance.paxType,
      'paxKey': instance.paxKey,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'documentNumber': instance.documentNumber,
      'nationality': instance.nationality,
      'dateofBirth': instance.dateofBirth,
      'countryofIssue': instance.countryofIssue,
      'dateOfExpiry': instance.dateOfExpiry,
      'objMealList': instance.objMealList,
      'objBaggage': instance.objBaggage,
      'objSeatList': instance.objSeatList,
    };

_$_BookingGstDetails _$$_BookingGstDetailsFromJson(Map<String, dynamic> json) =>
    _$_BookingGstDetails(
      gstNumber: json['gstNumber'] as String?,
      companyName: json['companyName'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      pincode: json['pincode'] as int?,
    );

Map<String, dynamic> _$$_BookingGstDetailsToJson(
        _$_BookingGstDetails instance) =>
    <String, dynamic>{
      'gstNumber': instance.gstNumber,
      'companyName': instance.companyName,
      'email': instance.email,
      'mobile': instance.mobile,
      'address': instance.address,
      'city': instance.city,
      'pincode': instance.pincode,
    };
