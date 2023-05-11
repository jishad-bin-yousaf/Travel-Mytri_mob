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
      departureDate: json['departureDate'] as String?,
      returnDate: json['returnDate'] as String?,
      adult: json['adult'] as int?,
      child: json['child'] as int?,
      infant: json['infant'] as int?,
      passengers: json['passengers'] as int?,
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
      'departureDate': instance.departureDate,
      'returnDate': instance.returnDate,
      'adult': instance.adult,
      'child': instance.child,
      'infant': instance.infant,
      'passengers': instance.passengers,
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
    );

Map<String, dynamic> _$$_AvailableAirlineToJson(_$_AvailableAirline instance) =>
    <String, dynamic>{
      'airlineCode': instance.airlineCode,
      'airlineName': instance.airlineName,
    };

_$_Apisearchresponse _$$_ApisearchresponseFromJson(Map<String, dynamic> json) =>
    _$_Apisearchresponse(
      itin_id: json['itin_id'] as int?,
      airlineName: json['airlineName'] as String?,
      airlineCOde: json['airlineCOde'] as String?,
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
      pricngList: (json['pricngList'] as List<dynamic>?)
          ?.map((e) => PricingBasic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ApisearchresponseToJson(
        _$_Apisearchresponse instance) =>
    <String, dynamic>{
      'itin_id': instance.itin_id,
      'airlineName': instance.airlineName,
      'airlineCOde': instance.airlineCOde,
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
      'pricngList': instance.pricngList,
    };

_$_PricingBasic _$$_PricingBasicFromJson(Map<String, dynamic> json) =>
    _$_PricingBasic(
      fareId: json['fareId'] as int?,
      fareName: json['fareName'] as String?,
      netAmount: (json['netAmount'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PricingBasicToJson(_$_PricingBasic instance) =>
    <String, dynamic>{
      'fareId': instance.fareId,
      'fareName': instance.fareName,
      'netAmount': instance.netAmount,
      'discount': instance.discount,
    };
