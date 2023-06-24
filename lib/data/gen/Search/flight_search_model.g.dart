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
      departureDate: json['departureDate'] as String?,
      tripmode: json['tripmode'] as String?,
    );

Map<String, dynamic> _$$_ObjsectorlistToJson(_$_Objsectorlist instance) =>
    <String, dynamic>{
      'origin': instance.origin,
      'origincountry': instance.origincountry,
      'destination': instance.destination,
      'destinationcountry': instance.destinationcountry,
      'departureDate': instance.departureDate,
      'tripmode': instance.tripmode,
    };

_$_AirlineSearchResponse _$$_AirlineSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_AirlineSearchResponse(
      status: json['status'] as bool?,
      test: json['test'] as bool?,
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
          ?.map((e) => ApiSearchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AirlineSearchResponseToJson(
        _$_AirlineSearchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'test': instance.test,
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

_$_RAirlineSearchResponse _$$_RAirlineSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_RAirlineSearchResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      test: json['test'] as bool?,
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
      'test': instance.test,
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
      fareId: json['fareId'] as int?,
      providerCode: json['providerCode'] as String?,
      onwardDetails: json['onwardDetails'] == null
          ? null
          : ApiSearchResponse.fromJson(
              json['onwardDetails'] as Map<String, dynamic>),
      returnDetails: json['returnDetails'] == null
          ? null
          : ApiSearchResponse.fromJson(
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
      'fareId': instance.fareId,
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
      flightNumber: json['flightNumber'] as String?,
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
      'flightNumber': instance.flightNumber,
      'departureCity': instance.departureCity,
      'arrivalAirportCode': instance.arrivalAirportCode,
      'arrivalTime': instance.arrivalTime,
      'arrivalDate': instance.arrivalDate,
      'arrivalAirport': instance.arrivalAirport,
      'arrivalCity': instance.arrivalCity,
      'travelDuration': instance.travelDuration,
      'layoverTime': instance.layoverTime,
    };

_$_PricingRequest _$$_PricingRequestFromJson(Map<String, dynamic> json) =>
    _$_PricingRequest(
      itinId: json['itinId'] as int?,
      itinIdR: json['itinIdR'] as int?,
      fareId: json['fareId'] as int?,
      fareIdR: json['fareIdR'] as int?,
      providerCode: json['providerCode'] as String?,
      providerCodeR: json['providerCodeR'] as String?,
    );

Map<String, dynamic> _$$_PricingRequestToJson(_$_PricingRequest instance) =>
    <String, dynamic>{
      'itinId': instance.itinId,
      'itinIdR': instance.itinIdR,
      'fareId': instance.fareId,
      'fareIdR': instance.fareIdR,
      'providerCode': instance.providerCode,
      'providerCodeR': instance.providerCodeR,
    };

_$_IRAirlineSearchResponse _$$_IRAirlineSearchResponseFromJson(
        Map<String, dynamic> json) =>
    _$_IRAirlineSearchResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      testO: json['testO'] as bool?,
      testR: json['testR'] as bool?,
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
          ?.map((e) => ApiSearchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      objItinListR: (json['objItinListR'] as List<dynamic>?)
          ?.map((e) => ApiSearchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_IRAirlineSearchResponseToJson(
        _$_IRAirlineSearchResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'testO': instance.testO,
      'testR': instance.testR,
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

_$_AvailableAirline _$$_AvailableAirlineFromJson(Map<String, dynamic> json) =>
    _$_AvailableAirline(
      airlineCode: json['airlineCode'] as String?,
      airlineName: json['airlineName'] as String?,
      minAmount: (json['minAmount'] as num?)?.toDouble(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$$_AvailableAirlineToJson(_$_AvailableAirline instance) =>
    <String, dynamic>{
      'airlineCode': instance.airlineCode,
      'airlineName': instance.airlineName,
      'minAmount': instance.minAmount,
      'count': instance.count,
    };

_$_ApiSearchResponse _$$_ApiSearchResponseFromJson(Map<String, dynamic> json) =>
    _$_ApiSearchResponse(
      itinId: json['itinId'] as int?,
      fareId: json['fareId'] as int?,
      providerCode: json['providerCode'] as String?,
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
      durationInMinutes: json['durationInMinutes'] as int?,
      freeBaggage: json['freeBaggage'] as String?,
      refundable: json['refundable'] as String?,
      sourceAirport: json['sourceAirport'] as String?,
      destinationAirport: json['destinationAirport'] as String?,
      noofSeat: json['noofSeat'] as int?,
      amount: (json['amount'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      adultFare: (json['adultFare'] as num?)?.toDouble(),
      noofStop: json['noofStop'] as int?,
      segmentDetails: json['segmentDetails'] as String?,
      codeshareAirlines: json['codeshareAirlines'] as String?,
      pricingList: (json['pricingList'] as List<dynamic>?)
          ?.map((e) => PricingBasic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ApiSearchResponseToJson(
        _$_ApiSearchResponse instance) =>
    <String, dynamic>{
      'itinId': instance.itinId,
      'fareId': instance.fareId,
      'providerCode': instance.providerCode,
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
      'durationInMinutes': instance.durationInMinutes,
      'freeBaggage': instance.freeBaggage,
      'refundable': instance.refundable,
      'sourceAirport': instance.sourceAirport,
      'destinationAirport': instance.destinationAirport,
      'noofSeat': instance.noofSeat,
      'amount': instance.amount,
      'discount': instance.discount,
      'netAmount': instance.netAmount,
      'adultFare': instance.adultFare,
      'noofStop': instance.noofStop,
      'segmentDetails': instance.segmentDetails,
      'codeshareAirlines': instance.codeshareAirlines,
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

_$_FlightDetailsRequest _$$_FlightDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    _$_FlightDetailsRequest(
      itinId: json['itinId'] as int?,
      fareId: json['fareId'] as int?,
      providerCode: json['providerCode'] as String?,
    );

Map<String, dynamic> _$$_FlightDetailsRequestToJson(
        _$_FlightDetailsRequest instance) =>
    <String, dynamic>{
      'itinId': instance.itinId,
      'fareId': instance.fareId,
      'providerCode': instance.providerCode,
    };

_$_FlightDetailsRequestIR _$$_FlightDetailsRequestIRFromJson(
        Map<String, dynamic> json) =>
    _$_FlightDetailsRequestIR(
      itinId: json['itinId'] as int?,
      itinIdR: json['itinIdR'] as int?,
      fareId: json['fareId'] as int?,
      fareIdR: json['fareIdR'] as int?,
      providerCode: json['providerCode'] as String?,
      providerCodeR: json['providerCodeR'] as String?,
    );

Map<String, dynamic> _$$_FlightDetailsRequestIRToJson(
        _$_FlightDetailsRequestIR instance) =>
    <String, dynamic>{
      'itinId': instance.itinId,
      'itinIdR': instance.itinIdR,
      'fareId': instance.fareId,
      'fareIdR': instance.fareIdR,
      'providerCode': instance.providerCode,
      'providerCodeR': instance.providerCodeR,
    };

_$_FlightDetailsResponseIR _$$_FlightDetailsResponseIRFromJson(
        Map<String, dynamic> json) =>
    _$_FlightDetailsResponseIR(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      objitin: json['objitin'] == null
          ? null
          : FlightDetailsItin.fromJson(json['objitin'] as Map<String, dynamic>),
      objitinR: json['objitinR'] == null
          ? null
          : FlightDetailsItin.fromJson(
              json['objitinR'] as Map<String, dynamic>),
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

Map<String, dynamic> _$$_FlightDetailsResponseIRToJson(
        _$_FlightDetailsResponseIR instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'objitin': instance.objitin,
      'objitinR': instance.objitinR,
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
