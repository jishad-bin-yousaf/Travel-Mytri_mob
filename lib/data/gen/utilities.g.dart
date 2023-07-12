// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/utilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AirportList _$$_AirportListFromJson(Map<String, dynamic> json) =>
    _$_AirportList(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      objAirportList: (json['objAirportList'] as List<dynamic>?)
          ?.map((e) => AirportData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AirportListToJson(_$_AirportList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'objAirportList': instance.objAirportList,
    };

_$_AirportData _$$_AirportDataFromJson(Map<String, dynamic> json) =>
    _$_AirportData(
      cityCode: json['cityCode'] as String?,
      code: json['code'] as String?,
      cityName: json['cityName'] as String?,
      countryCode: json['countryCode'] as String?,
      airportName: json['airportName'] as String?,
      order: json['order'] as int?,
      timeZone: json['timeZone'] as String?,
    );

Map<String, dynamic> _$$_AirportDataToJson(_$_AirportData instance) =>
    <String, dynamic>{
      'cityCode': instance.cityCode,
      'code': instance.code,
      'cityName': instance.cityName,
      'countryCode': instance.countryCode,
      'airportName': instance.airportName,
      'order': instance.order,
      'timeZone': instance.timeZone,
    };

_$_CountryResponse _$$_CountryResponseFromJson(Map<String, dynamic> json) =>
    _$_CountryResponse(
      objCountry: (json['objCountry'] as List<dynamic>?)
          ?.map((e) => ClsCountriesJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
    );

Map<String, dynamic> _$$_CountryResponseToJson(_$_CountryResponse instance) =>
    <String, dynamic>{
      'objCountry': instance.objCountry,
      'status': instance.status,
      'responseMessage': instance.responseMessage,
    };

_$_ClsCountriesJson _$$_ClsCountriesJsonFromJson(Map<String, dynamic> json) =>
    _$_ClsCountriesJson(
      id: json['id'] as int?,
      name: json['name'] as String?,
      countryCode: json['countryCode'] as String?,
      phoneCode: json['phoneCode'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$_ClsCountriesJsonToJson(_$_ClsCountriesJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'countryCode': instance.countryCode,
      'phoneCode': instance.phoneCode,
      'currency': instance.currency,
    };

_$_StateResponse _$$_StateResponseFromJson(Map<String, dynamic> json) =>
    _$_StateResponse(
      objState: (json['objState'] as List<dynamic>?)
          ?.map((e) => ClsStatesJson.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
    );

Map<String, dynamic> _$$_StateResponseToJson(_$_StateResponse instance) =>
    <String, dynamic>{
      'objState': instance.objState,
      'status': instance.status,
      'responseMessage': instance.responseMessage,
    };

_$_ClsStatesJson _$$_ClsStatesJsonFromJson(Map<String, dynamic> json) =>
    _$_ClsStatesJson(
      name: json['name'] as String?,
      countryId: json['countryId'] as int?,
      countryCode: json['countryCode'] as String?,
      stateCode: json['stateCode'] as String?,
    );

Map<String, dynamic> _$$_ClsStatesJsonToJson(_$_ClsStatesJson instance) =>
    <String, dynamic>{
      'name': instance.name,
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'stateCode': instance.stateCode,
    };
