import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/airport_list.freezed.dart';
part '../gen/airport_list.g.dart';

@freezed
class AirportList with _$AirportList {
  const factory AirportList({
    List<AirportData>? objAirportList,
  }) = _AirportList;

  factory AirportList.fromJson(Map<String, dynamic> json) => _$AirportListFromJson(json);
}

@freezed
class AirportData with _$AirportData {
  const factory AirportData({
    String? cityCode,
    String? code,
    String? cityName,
    String? countryCode,
    String? airportName,
    int? order,
    String? timeZone,
  }) = _AirportData;

  factory AirportData.fromJson(Map<String, dynamic> json) => _$AirportDataFromJson(json);
}
