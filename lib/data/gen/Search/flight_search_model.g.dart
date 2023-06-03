// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/Search/flight_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlightSearchModel _$$_FlightSearchModelFromJson(Map<String, dynamic> json) =>
    _$_FlightSearchModel(
      objsectorlist: (json['objsectorlist'] as List<dynamic>?)
          ?.map((e) => Objsectorlist.fromJson(e as Map<String, dynamic>))
          .toList(),
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      airlineClass: json['airlineClass'] as String?,
      prefferedCarriers: json['prefferedCarriers'] as String?,
      prefferedProviders: json['prefferedProviders'] as String?,
      fareType: json['fareType'] as String?,
      isdirect: json['isdirect'] as bool?,
      traveltype: json['traveltype'] as String?,
    );

Map<String, dynamic> _$$_FlightSearchModelToJson(
        _$_FlightSearchModel instance) =>
    <String, dynamic>{
      'objsectorlist': instance.objsectorlist,
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'airlineClass': instance.airlineClass,
      'prefferedCarriers': instance.prefferedCarriers,
      'prefferedProviders': instance.prefferedProviders,
      'fareType': instance.fareType,
      'isdirect': instance.isdirect,
      'traveltype': instance.traveltype,
    };

_$_Objsectorlist _$$_ObjsectorlistFromJson(Map<String, dynamic> json) =>
    _$_Objsectorlist(
      origin: json['origin'] as String?,
      origincountry: json['origincountry'] as String?,
      destination: json['destination'] as String?,
      destinationcountry: json['destinationcountry'] as String?,
      departureDate: json['departureDate'] == null
          ? null
          : DateTime.parse(json['departureDate'] as String),
      tripmode: json['tripmode'] as String?,
    );

Map<String, dynamic> _$$_ObjsectorlistToJson(_$_Objsectorlist instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'origincountry': instance.origincountry,
      'destination': instance.destination,
      'destinationcountry': instance.destinationcountry,
      'departureDate': instance.departureDate?.toIso8601String(),
      'tripmode': instance.tripmode,
    };

_$_AirlineSearchResponse _$$_AirlineSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AirlineSearchResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      airlineClass: json['airlineClass'] as String?,
      departureDate: json['departureDate'] == null
          ? null
          : DateTime.parse(json['departureDate'] as String),
      returnDate: json['returnDate'] as String?,
      adult: json['adult'] as num?,
      child: json['child'] as num?,
      infant: json['infant'] as num?,
      objlowfareList: (json['objlowfareList'] as List<dynamic>?)
          ?.map((e) => LowestFare.fromJson(e as Map<String, dynamic>))
          .toList(),
      minimumFare: (json['minimumFare'] as num?)?.toDouble(),
      maximumFare: (json['maximumFare'] as num?)?.toDouble(),
      objAvlairlineList: (json['objAvlairlineList'] as List<dynamic>?)
          ?.map((e) => AvailableAirline.fromJson(e as Map<String, dynamic>))
          .toList(),
      objItinList: (json['objItinList'] as List<dynamic>?)
          ?.map((e) => Apisearchresponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AirlineSearchResponseToJson(
        _$_AirlineSearchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'origin': instance.origin,
      'destination': instance.destination,
      'airlineClass': instance.airlineClass,
      'departureDate': instance.departureDate?.toIso8601String(),
      'returnDate': instance.returnDate,
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'objlowfareList': instance.objlowfareList,
      'minimumFare': instance.minimumFare,
      'maximumFare': instance.maximumFare,
      'objAvlairlineList': instance.objAvlairlineList,
      'objItinList': instance.objItinList,
    };

_$_LowestFare _$$_LowestFareFromJson(Map<String, dynamic> json) =>
    _$_LowestFare(
      airlineName: json['airlineName'] as String?,
      amount: json['amount'] as String?,
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$_LowestFareToJson(_$_LowestFare instance) =>
    <String, dynamic>{
      'airlineName': instance.airlineName,
      'amount': instance.amount,
      'date': instance.date,
    };

_$_AvailableAirline _$$_AvailableAirlineFromJson(Map<String, dynamic> json) =>
    _$_AvailableAirline(
      airlineCode: json['airlineCode'] as String?,
      airlineName: json['airlineName'] as String?,
      minAmount: (json['minAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_AvailableAirlineToJson(_$_AvailableAirline instance) =>
    <String, dynamic>{
      'airlineCode': instance.airlineCode,
      'airlineName': instance.airlineName,
      'minAmount': instance.minAmount,
    };

_$_Apisearchresponse _$$_ApisearchresponseFromJson(Map<String, dynamic> json) =>
    _$_Apisearchresponse(
      itinId: json['itinId'] as int?,
      providerCode: json['providerCode'] as String?,
      airlineName: json['airlineName'] as String?,
      airlineCode: json['airlineCode'] as String?,
      flightDetails: json['flightDetails'] as String?,
      source: json['source'] as String?,
      destination: json['destination'] as String?,
      origin: json['origin'] as String?,
      departureDate: json['departureDate'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      departureTime: json['departureTime'] as String?,
      arrivalTime: json['arrivalTime'] as String?,
      duration: json['duration'] as String?,
      freeBaggage: json['freeBaggage'] as String?,
      refundable: json['refundable'] as String?,
      sourceAirport: json['sourceAirport'] as String?,
      destinationAirport: json['destinationAirport'] as String?,
      noofSeat: json['noofSeat'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      noofStop: json['noofStop'] as int?,
      segmentDetails: json['segmentDetails'] as String?,
      pricingList: (json['pricingList'] as List<dynamic>?)
          ?.map((e) => PricingBasic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ApisearchresponseToJson(
        _$_Apisearchresponse instance) =>
    <String, dynamic>{
      'itinId': instance.itinId,
      'providerCode': instance.providerCode,
      'airlineName': instance.airlineName,
      'airlineCode': instance.airlineCode,
      'flightDetails': instance.flightDetails,
      'source': instance.source,
      'destination': instance.destination,
      'origin': instance.origin,
      'departureDate': instance.departureDate,
      'arrivalDate': instance.arrivalDate,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
      'duration': instance.duration,
      'freeBaggage': instance.freeBaggage,
      'refundable': instance.refundable,
      'sourceAirport': instance.sourceAirport,
      'destinationAirport': instance.destinationAirport,
      'noofSeat': instance.noofSeat,
      'amount': instance.amount,
      'discount': instance.discount,
      'netAmount': instance.netAmount,
      'noofStop': instance.noofStop,
      'segmentDetails': instance.segmentDetails,
      'pricingList': instance.pricingList,
    };

_$_PricingBasic _$$_PricingBasicFromJson(Map<String, dynamic> json) =>
    _$_PricingBasic(
      fareId: json['fareId'] as int?,
      fareName: json['fareName'] as String?,
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      cabinBaggage: json['cabinBaggage'] as String?,
      checkinBaggage: json['checkinBaggage'] as String?,
      meal: json['meal'] as String?,
      seat: json['seat'] as String?,
      cancellation: json['cancellation'] as String?,
      dateChange: json['dateChange'] as String?,
    );

Map<String, dynamic> _$$_PricingBasicToJson(_$_PricingBasic instance) =>
    <String, dynamic>{
      'fareId': instance.fareId,
      'fareName': instance.fareName,
      'netAmount': instance.netAmount,
      'discount': instance.discount,
      'cabinBaggage': instance.cabinBaggage,
      'checkinBaggage': instance.checkinBaggage,
      'meal': instance.meal,
      'seat': instance.seat,
      'cancellation': instance.cancellation,
      'dateChange': instance.dateChange,
    };

_$_IRAirlineSearchResponse _$$_IRAirlineSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_IRAirlineSearchResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      airlineClass: json['airlineClass'] as String?,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      departureDate: json['departureDate'] == null
          ? null
          : DateTime.parse(json['departureDate'] as String),
      originR: json['originR'] as String?,
      destinationR: json['destinationR'] as String?,
      returnDate: json['returnDate'] == null
          ? null
          : DateTime.parse(json['returnDate'] as String),
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      minimumFare: (json['minimumFare'] as num?)?.toDouble(),
      maximumFare: (json['maximumFare'] as num?)?.toDouble(),
      minimumFareR: (json['minimumFareR'] as num?)?.toDouble(),
      maximumFareR: (json['maximumFareR'] as num?)?.toDouble(),
      objAvlairlineList: (json['objAvlairlineList'] as List<dynamic>?)
          ?.map((e) => AvailableAirline.fromJson(e as Map<String, dynamic>))
          .toList(),
      objItinList: (json['objItinList'] as List<dynamic>?)
          ?.map((e) => Apisearchresponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      objItinListR: (json['objItinListR'] as List<dynamic>?)
          ?.map((e) => Apisearchresponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IRAirlineSearchResponseToJson(
        _$_IRAirlineSearchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'airlineClass': instance.airlineClass,
      'origin': instance.origin,
      'destination': instance.destination,
      'departureDate': instance.departureDate?.toIso8601String(),
      'originR': instance.originR,
      'destinationR': instance.destinationR,
      'returnDate': instance.returnDate?.toIso8601String(),
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'minimumFare': instance.minimumFare,
      'maximumFare': instance.maximumFare,
      'minimumFareR': instance.minimumFareR,
      'maximumFareR': instance.maximumFareR,
      'objAvlairlineList': instance.objAvlairlineList,
      'objItinList': instance.objItinList,
      'objItinListR': instance.objItinListR,
    };

_$_RAirlineSearchResponse _$$_RAirlineSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RAirlineSearchResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      airlineClass: json['airlineClass'] as String?,
      origin: json['origin'] as String?,
      destination: json['destination'] as String?,
      departureDate: json['departureDate'] == null
          ? null
          : DateTime.parse(json['departureDate'] as String),
      returnDate: json['returnDate'] == null
          ? null
          : DateTime.parse(json['returnDate'] as String),
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      minimumFare: (json['minimumFare'] as num?)?.toDouble(),
      maximumFare: (json['maximumFare'] as num?)?.toDouble(),
      objAvlairlineList: (json['objAvlairlineList'] as List<dynamic>?)
          ?.map((e) => AvailableAirline.fromJson(e as Map<String, dynamic>))
          .toList(),
      objItinList: (json['objItinList'] as List<dynamic>?)
          ?.map((e) => RApisearchresponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RAirlineSearchResponseToJson(
        _$_RAirlineSearchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'airlineClass': instance.airlineClass,
      'origin': instance.origin,
      'destination': instance.destination,
      'departureDate': instance.departureDate?.toIso8601String(),
      'returnDate': instance.returnDate?.toIso8601String(),
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'minimumFare': instance.minimumFare,
      'maximumFare': instance.maximumFare,
      'objAvlairlineList': instance.objAvlairlineList,
      'objItinList': instance.objItinList,
    };

_$_RApisearchresponse _$$_RApisearchresponseFromJson(
        Map<String, dynamic> json) =>
    _$_RApisearchresponse(
      itinId: json['itinId'] as int?,
      providerCode: json['providerCode'] as String?,
      onwardDetails: json['onwardDetails'] == null
          ? null
          : Apisearchresponse.fromJson(
              json['onwardDetails'] as Map<String, dynamic>),
      returnDetails: json['returnDetails'] == null
          ? null
          : Apisearchresponse.fromJson(
              json['returnDetails'] as Map<String, dynamic>),
      amount: (json['amount'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      pricingList: (json['pricingList'] as List<dynamic>?)
          ?.map((e) => PricingBasic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RApisearchresponseToJson(
        _$_RApisearchresponse instance) =>
    <String, dynamic>{
      'itinId': instance.itinId,
      'providerCode': instance.providerCode,
      'onwardDetails': instance.onwardDetails,
      'returnDetails': instance.returnDetails,
      'amount': instance.amount,
      'discount': instance.discount,
      'netAmount': instance.netAmount,
      'pricingList': instance.pricingList,
    };

_$_Apisearchresponsedetails _$$_ApisearchresponsedetailsFromJson(
        Map<String, dynamic> json) =>
    _$_Apisearchresponsedetails(
      airlineCode: json['airlineCode'] as String?,
      airlineName: json['airlineName'] as String?,
      flightDetails: json['flightDetails'] as String?,
      source: json['source'] as String?,
      destination: json['destination'] as String?,
      departureDate: json['departureDate'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      departureTime: json['departureTime'] as String?,
      arrivalTime: json['arrivalTime'] as String?,
      duration: json['duration'] as String?,
      freeBaggage: json['freeBaggage'] as String?,
      refundable: json['refundable'] as String?,
      sourceAirport: json['sourceAirport'] as String?,
      destinationAirport: json['destinationAirport'] as String?,
      noofSeat: json['noofSeat'] as int?,
      noofStop: json['noofStop'] as int?,
      segmentDetails: json['segmentDetails'] as String?,
    );

Map<String, dynamic> _$$_ApisearchresponsedetailsToJson(
        _$_Apisearchresponsedetails instance) =>
    <String, dynamic>{
      'airlineCode': instance.airlineCode,
      'airlineName': instance.airlineName,
      'flightDetails': instance.flightDetails,
      'source': instance.source,
      'destination': instance.destination,
      'departureDate': instance.departureDate,
      'arrivalDate': instance.arrivalDate,
      'departureTime': instance.departureTime,
      'arrivalTime': instance.arrivalTime,
      'duration': instance.duration,
      'freeBaggage': instance.freeBaggage,
      'refundable': instance.refundable,
      'sourceAirport': instance.sourceAirport,
      'destinationAirport': instance.destinationAirport,
      'noofSeat': instance.noofSeat,
      'noofStop': instance.noofStop,
      'segmentDetails': instance.segmentDetails,
    };

_$_PricingResponse _$$_PricingResponseFromJson(Map<String, dynamic> json) =>
    _$_PricingResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      objSegList: (json['objSegList'] as List<dynamic>?)
          ?.map((e) => PricingDetailsList.fromJson(e as Map<String, dynamic>))
          .toList(),
      adultBasic: (json['adultBasic'] as num?)?.toDouble(),
      childBasic: (json['childBasic'] as num?)?.toDouble(),
      infantBasic: (json['infantBasic'] as num?)?.toDouble(),
      taxList: (json['taxList'] as List<dynamic>?)
          ?.map((e) => TaxSplitup.fromJson(e as Map<String, dynamic>))
          .toList(),
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      adultTotal: (json['adultTotal'] as num?)?.toDouble(),
      childTotal: (json['childTotal'] as num?)?.toDouble(),
      infantTotal: (json['infantTotal'] as num?)?.toDouble(),
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

Map<String, dynamic> _$$_PricingResponseToJson(_$_PricingResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'objSegList': instance.objSegList,
      'adultBasic': instance.adultBasic,
      'childBasic': instance.childBasic,
      'infantBasic': instance.infantBasic,
      'taxList': instance.taxList,
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'adultTotal': instance.adultTotal,
      'childTotal': instance.childTotal,
      'infantTotal': instance.infantTotal,
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

_$_FlightDetailsResponse _$$_FlightDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_FlightDetailsResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      objitin: json['objitin'] == null
          ? null
          : FlightDetailsItin.fromJson(json['objitin'] as Map<String, dynamic>),
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      adtBasic: (json['adtBasic'] as num?)?.toDouble(),
      adtTax: (json['adtTax'] as num?)?.toDouble(),
      chdBasic: (json['chdBasic'] as num?)?.toDouble(),
      chdTax: (json['chdTax'] as num?)?.toDouble(),
      infBasic: (json['infBasic'] as num?)?.toDouble(),
      infTax: (json['infTax'] as num?)?.toDouble(),
      totalFare: (json['totalFare'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_FlightDetailsResponseToJson(
        _$_FlightDetailsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'objitin': instance.objitin,
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'adtBasic': instance.adtBasic,
      'adtTax': instance.adtTax,
      'chdBasic': instance.chdBasic,
      'chdTax': instance.chdTax,
      'infBasic': instance.infBasic,
      'infTax': instance.infTax,
      'totalFare': instance.totalFare,
    };

_$_FlightDetailsItin _$$_FlightDetailsItinFromJson(Map<String, dynamic> json) =>
    _$_FlightDetailsItin(
      originCity: json['originCity'] as String?,
      destinationCity: json['destinationCity'] as String?,
      departureDate: json['departureDate'] as String?,
      objseglist: (json['objseglist'] as List<dynamic>?)
          ?.map((e) => FlightDetailsSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      adultCheckinBaggage: json['adultCheckinBaggage'] as String?,
      adultCabinBaggage: json['adultCabinBaggage'] as String?,
      childCheckinBaggage: json['childCheckinBaggage'] as String?,
      childCabinBaggage: json['childCabinBaggage'] as String?,
      infantCheckinBaggage: json['infantCheckinBaggage'] as String?,
      infantCabinBaggage: json['infantCabinBaggage'] as String?,
    );

Map<String, dynamic> _$$_FlightDetailsItinToJson(
        _$_FlightDetailsItin instance) =>
    <String, dynamic>{
      'originCity': instance.originCity,
      'destinationCity': instance.destinationCity,
      'departureDate': instance.departureDate,
      'objseglist': instance.objseglist,
      'adultCheckinBaggage': instance.adultCheckinBaggage,
      'adultCabinBaggage': instance.adultCabinBaggage,
      'childCheckinBaggage': instance.childCheckinBaggage,
      'childCabinBaggage': instance.childCabinBaggage,
      'infantCheckinBaggage': instance.infantCheckinBaggage,
      'infantCabinBaggage': instance.infantCabinBaggage,
    };

_$_FlightDetailsSegment _$$_FlightDetailsSegmentFromJson(
        Map<String, dynamic> json) =>
    _$_FlightDetailsSegment(
      airlineCode: json['airlineCode'] as String?,
      airlineName: json['airlineName'] as String?,
      airlineFlightClass: json['airlineFlightClass'] as String?,
      departureAirportCode: json['departureAirportCode'] as String?,
      departureTime: json['departureTime'] as String?,
      departureDate: json['departureDate'] as String?,
      departureAirport: json['departureAirport'] as String?,
      departureCity: json['departureCity'] as String?,
      arrivalAirportCode: json['arrivalAirportCode'] as String?,
      arrivalTime: json['arrivalTime'] as String?,
      arrivalDate: json['arrivalDate'] as String?,
      arrivalAirport: json['arrivalAirport'] as String?,
      arrivalCity: json['arrivalCity'] as String?,
      travelDuration: json['travelDuration'] as String?,
      layoverTime: json['layoverTime'] as String?,
    );

Map<String, dynamic> _$$_FlightDetailsSegmentToJson(
        _$_FlightDetailsSegment instance) =>
    <String, dynamic>{
      'airlineCode': instance.airlineCode,
      'airlineName': instance.airlineName,
      'airlineFlightClass': instance.airlineFlightClass,
      'departureAirportCode': instance.departureAirportCode,
      'departureTime': instance.departureTime,
      'departureDate': instance.departureDate,
      'departureAirport': instance.departureAirport,
      'departureCity': instance.departureCity,
      'arrivalAirportCode': instance.arrivalAirportCode,
      'arrivalTime': instance.arrivalTime,
      'arrivalDate': instance.arrivalDate,
      'arrivalAirport': instance.arrivalAirport,
      'arrivalCity': instance.arrivalCity,
      'travelDuration': instance.travelDuration,
      'layoverTime': instance.layoverTime,
    };
