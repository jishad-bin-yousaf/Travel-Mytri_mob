// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/airport_list.dart';

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
