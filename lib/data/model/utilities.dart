import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/utilities.freezed.dart';
part '../gen/utilities.g.dart';

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

@freezed
class CountryResponse with _$CountryResponse {
  const factory CountryResponse({
    List<ClsCountriesJson>? objCountry,
    bool? status,
    String? responseMessage,
  }) = _CountryResponse;

  factory CountryResponse.fromJson(Map<String, dynamic> json) => _$CountryResponseFromJson(json);
}

@freezed
class ClsCountriesJson with _$ClsCountriesJson {
  const factory ClsCountriesJson({
    int? id,
    String? name,
    String? countryCode,
    String? phoneCode,
    String? currency,
  }) = _ClsCountriesJson;

  factory ClsCountriesJson.fromJson(Map<String, dynamic> json) => _$ClsCountriesJsonFromJson(json);
}

@freezed
class StateResponse with _$StateResponse {
  const factory StateResponse({
    List<ClsStatesJson>? objState,
    bool? status,
    String? responseMessage,
  }) = _StateResponse;

  factory StateResponse.fromJson(Map<String, dynamic> json) => _$StateResponseFromJson(json);
}

@freezed
class ClsStatesJson with _$ClsStatesJson {
  const factory ClsStatesJson({
    String? name,
    int? countryId,
    String? countryCode,
    String? stateCode,
  }) = _ClsStatesJson;

  factory ClsStatesJson.fromJson(Map<String, dynamic> json) => _$ClsStatesJsonFromJson(json);
}
