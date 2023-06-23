// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/utilities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AirportList _$$_AirportListFromJson(Map<String, dynamic> json) =>
    _$_AirportList(
      objAirportList: (json['objAirportList'] as List<dynamic>?)
          ?.map((e) => AirportData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AirportListToJson(_$_AirportList instance) =>
    <String, dynamic>{
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
      iso3: json['iso3'] as String?,
      iso2: json['iso2'] as String?,
      numeric_code: json['numeric_code'] as String?,
      phone_code: json['phone_code'] as String?,
      capital: json['capital'] as String?,
      currency: json['currency'] as String?,
      currency_name: json['currency_name'] as String?,
      currency_symbol: json['currency_symbol'] as String?,
      tld: json['tld'] as String?,
      native: json['native'] as String?,
      region: json['region'] as String?,
      subregion: json['subregion'] as String?,
    );

Map<String, dynamic> _$$_ClsCountriesJsonToJson(_$_ClsCountriesJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iso3': instance.iso3,
      'iso2': instance.iso2,
      'numeric_code': instance.numeric_code,
      'phone_code': instance.phone_code,
      'capital': instance.capital,
      'currency': instance.currency,
      'currency_name': instance.currency_name,
      'currency_symbol': instance.currency_symbol,
      'tld': instance.tld,
      'native': instance.native,
      'region': instance.region,
      'subregion': instance.subregion,
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
      id: json['id'] as int?,
      name: json['name'] as String?,
      country_id: json['country_id'] as int?,
      country_code: json['country_code'] as String?,
      country_name: json['country_name'] as String?,
      state_code: json['state_code'] as String?,
      type: json['type'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$$_ClsStatesJsonToJson(_$_ClsStatesJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country_id': instance.country_id,
      'country_code': instance.country_code,
      'country_name': instance.country_name,
      'state_code': instance.state_code,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
