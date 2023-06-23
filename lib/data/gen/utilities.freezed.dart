// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../model/utilities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AirportList _$AirportListFromJson(Map<String, dynamic> json) {
  return _AirportList.fromJson(json);
}

/// @nodoc
mixin _$AirportList {
  List<AirportData>? get objAirportList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirportListCopyWith<AirportList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirportListCopyWith<$Res> {
  factory $AirportListCopyWith(
          AirportList value, $Res Function(AirportList) then) =
      _$AirportListCopyWithImpl<$Res, AirportList>;
  @useResult
  $Res call({List<AirportData>? objAirportList});
}

/// @nodoc
class _$AirportListCopyWithImpl<$Res, $Val extends AirportList>
    implements $AirportListCopyWith<$Res> {
  _$AirportListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objAirportList = freezed,
  }) {
    return _then(_value.copyWith(
      objAirportList: freezed == objAirportList
          ? _value.objAirportList
          : objAirportList // ignore: cast_nullable_to_non_nullable
              as List<AirportData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AirportListCopyWith<$Res>
    implements $AirportListCopyWith<$Res> {
  factory _$$_AirportListCopyWith(
          _$_AirportList value, $Res Function(_$_AirportList) then) =
      __$$_AirportListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AirportData>? objAirportList});
}

/// @nodoc
class __$$_AirportListCopyWithImpl<$Res>
    extends _$AirportListCopyWithImpl<$Res, _$_AirportList>
    implements _$$_AirportListCopyWith<$Res> {
  __$$_AirportListCopyWithImpl(
      _$_AirportList _value, $Res Function(_$_AirportList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objAirportList = freezed,
  }) {
    return _then(_$_AirportList(
      objAirportList: freezed == objAirportList
          ? _value._objAirportList
          : objAirportList // ignore: cast_nullable_to_non_nullable
              as List<AirportData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AirportList implements _AirportList {
  const _$_AirportList({final List<AirportData>? objAirportList})
      : _objAirportList = objAirportList;

  factory _$_AirportList.fromJson(Map<String, dynamic> json) =>
      _$$_AirportListFromJson(json);

  final List<AirportData>? _objAirportList;
  @override
  List<AirportData>? get objAirportList {
    final value = _objAirportList;
    if (value == null) return null;
    if (_objAirportList is EqualUnmodifiableListView) return _objAirportList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AirportList(objAirportList: $objAirportList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AirportList &&
            const DeepCollectionEquality()
                .equals(other._objAirportList, _objAirportList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_objAirportList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AirportListCopyWith<_$_AirportList> get copyWith =>
      __$$_AirportListCopyWithImpl<_$_AirportList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AirportListToJson(
      this,
    );
  }
}

abstract class _AirportList implements AirportList {
  const factory _AirportList({final List<AirportData>? objAirportList}) =
      _$_AirportList;

  factory _AirportList.fromJson(Map<String, dynamic> json) =
      _$_AirportList.fromJson;

  @override
  List<AirportData>? get objAirportList;
  @override
  @JsonKey(ignore: true)
  _$$_AirportListCopyWith<_$_AirportList> get copyWith =>
      throw _privateConstructorUsedError;
}

AirportData _$AirportDataFromJson(Map<String, dynamic> json) {
  return _AirportData.fromJson(json);
}

/// @nodoc
mixin _$AirportData {
  String? get cityCode => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get cityName => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get airportName => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;
  String? get timeZone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirportDataCopyWith<AirportData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirportDataCopyWith<$Res> {
  factory $AirportDataCopyWith(
          AirportData value, $Res Function(AirportData) then) =
      _$AirportDataCopyWithImpl<$Res, AirportData>;
  @useResult
  $Res call(
      {String? cityCode,
      String? code,
      String? cityName,
      String? countryCode,
      String? airportName,
      int? order,
      String? timeZone});
}

/// @nodoc
class _$AirportDataCopyWithImpl<$Res, $Val extends AirportData>
    implements $AirportDataCopyWith<$Res> {
  _$AirportDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityCode = freezed,
    Object? code = freezed,
    Object? cityName = freezed,
    Object? countryCode = freezed,
    Object? airportName = freezed,
    Object? order = freezed,
    Object? timeZone = freezed,
  }) {
    return _then(_value.copyWith(
      cityCode: freezed == cityCode
          ? _value.cityCode
          : cityCode // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      airportName: freezed == airportName
          ? _value.airportName
          : airportName // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      timeZone: freezed == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AirportDataCopyWith<$Res>
    implements $AirportDataCopyWith<$Res> {
  factory _$$_AirportDataCopyWith(
          _$_AirportData value, $Res Function(_$_AirportData) then) =
      __$$_AirportDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? cityCode,
      String? code,
      String? cityName,
      String? countryCode,
      String? airportName,
      int? order,
      String? timeZone});
}

/// @nodoc
class __$$_AirportDataCopyWithImpl<$Res>
    extends _$AirportDataCopyWithImpl<$Res, _$_AirportData>
    implements _$$_AirportDataCopyWith<$Res> {
  __$$_AirportDataCopyWithImpl(
      _$_AirportData _value, $Res Function(_$_AirportData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cityCode = freezed,
    Object? code = freezed,
    Object? cityName = freezed,
    Object? countryCode = freezed,
    Object? airportName = freezed,
    Object? order = freezed,
    Object? timeZone = freezed,
  }) {
    return _then(_$_AirportData(
      cityCode: freezed == cityCode
          ? _value.cityCode
          : cityCode // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      cityName: freezed == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      airportName: freezed == airportName
          ? _value.airportName
          : airportName // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      timeZone: freezed == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AirportData implements _AirportData {
  const _$_AirportData(
      {this.cityCode,
      this.code,
      this.cityName,
      this.countryCode,
      this.airportName,
      this.order,
      this.timeZone});

  factory _$_AirportData.fromJson(Map<String, dynamic> json) =>
      _$$_AirportDataFromJson(json);

  @override
  final String? cityCode;
  @override
  final String? code;
  @override
  final String? cityName;
  @override
  final String? countryCode;
  @override
  final String? airportName;
  @override
  final int? order;
  @override
  final String? timeZone;

  @override
  String toString() {
    return 'AirportData(cityCode: $cityCode, code: $code, cityName: $cityName, countryCode: $countryCode, airportName: $airportName, order: $order, timeZone: $timeZone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AirportData &&
            (identical(other.cityCode, cityCode) ||
                other.cityCode == cityCode) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.airportName, airportName) ||
                other.airportName == airportName) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cityCode, code, cityName,
      countryCode, airportName, order, timeZone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AirportDataCopyWith<_$_AirportData> get copyWith =>
      __$$_AirportDataCopyWithImpl<_$_AirportData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AirportDataToJson(
      this,
    );
  }
}

abstract class _AirportData implements AirportData {
  const factory _AirportData(
      {final String? cityCode,
      final String? code,
      final String? cityName,
      final String? countryCode,
      final String? airportName,
      final int? order,
      final String? timeZone}) = _$_AirportData;

  factory _AirportData.fromJson(Map<String, dynamic> json) =
      _$_AirportData.fromJson;

  @override
  String? get cityCode;
  @override
  String? get code;
  @override
  String? get cityName;
  @override
  String? get countryCode;
  @override
  String? get airportName;
  @override
  int? get order;
  @override
  String? get timeZone;
  @override
  @JsonKey(ignore: true)
  _$$_AirportDataCopyWith<_$_AirportData> get copyWith =>
      throw _privateConstructorUsedError;
}

CountryResponse _$CountryResponseFromJson(Map<String, dynamic> json) {
  return _CountryResponse.fromJson(json);
}

/// @nodoc
mixin _$CountryResponse {
  List<ClsCountriesJson>? get objCountry => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryResponseCopyWith<CountryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryResponseCopyWith<$Res> {
  factory $CountryResponseCopyWith(
          CountryResponse value, $Res Function(CountryResponse) then) =
      _$CountryResponseCopyWithImpl<$Res, CountryResponse>;
  @useResult
  $Res call(
      {List<ClsCountriesJson>? objCountry,
      bool? status,
      String? responseMessage});
}

/// @nodoc
class _$CountryResponseCopyWithImpl<$Res, $Val extends CountryResponse>
    implements $CountryResponseCopyWith<$Res> {
  _$CountryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objCountry = freezed,
    Object? status = freezed,
    Object? responseMessage = freezed,
  }) {
    return _then(_value.copyWith(
      objCountry: freezed == objCountry
          ? _value.objCountry
          : objCountry // ignore: cast_nullable_to_non_nullable
              as List<ClsCountriesJson>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryResponseCopyWith<$Res>
    implements $CountryResponseCopyWith<$Res> {
  factory _$$_CountryResponseCopyWith(
          _$_CountryResponse value, $Res Function(_$_CountryResponse) then) =
      __$$_CountryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ClsCountriesJson>? objCountry,
      bool? status,
      String? responseMessage});
}

/// @nodoc
class __$$_CountryResponseCopyWithImpl<$Res>
    extends _$CountryResponseCopyWithImpl<$Res, _$_CountryResponse>
    implements _$$_CountryResponseCopyWith<$Res> {
  __$$_CountryResponseCopyWithImpl(
      _$_CountryResponse _value, $Res Function(_$_CountryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objCountry = freezed,
    Object? status = freezed,
    Object? responseMessage = freezed,
  }) {
    return _then(_$_CountryResponse(
      objCountry: freezed == objCountry
          ? _value._objCountry
          : objCountry // ignore: cast_nullable_to_non_nullable
              as List<ClsCountriesJson>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CountryResponse implements _CountryResponse {
  const _$_CountryResponse(
      {final List<ClsCountriesJson>? objCountry,
      this.status,
      this.responseMessage})
      : _objCountry = objCountry;

  factory _$_CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CountryResponseFromJson(json);

  final List<ClsCountriesJson>? _objCountry;
  @override
  List<ClsCountriesJson>? get objCountry {
    final value = _objCountry;
    if (value == null) return null;
    if (_objCountry is EqualUnmodifiableListView) return _objCountry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? status;
  @override
  final String? responseMessage;

  @override
  String toString() {
    return 'CountryResponse(objCountry: $objCountry, status: $status, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryResponse &&
            const DeepCollectionEquality()
                .equals(other._objCountry, _objCountry) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_objCountry),
      status,
      responseMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryResponseCopyWith<_$_CountryResponse> get copyWith =>
      __$$_CountryResponseCopyWithImpl<_$_CountryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryResponseToJson(
      this,
    );
  }
}

abstract class _CountryResponse implements CountryResponse {
  const factory _CountryResponse(
      {final List<ClsCountriesJson>? objCountry,
      final bool? status,
      final String? responseMessage}) = _$_CountryResponse;

  factory _CountryResponse.fromJson(Map<String, dynamic> json) =
      _$_CountryResponse.fromJson;

  @override
  List<ClsCountriesJson>? get objCountry;
  @override
  bool? get status;
  @override
  String? get responseMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CountryResponseCopyWith<_$_CountryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ClsCountriesJson _$ClsCountriesJsonFromJson(Map<String, dynamic> json) {
  return _ClsCountriesJson.fromJson(json);
}

/// @nodoc
mixin _$ClsCountriesJson {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get iso3 => throw _privateConstructorUsedError;
  String? get iso2 => throw _privateConstructorUsedError;
  String? get numeric_code => throw _privateConstructorUsedError;
  String? get phone_code => throw _privateConstructorUsedError;
  String? get capital => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get currency_name => throw _privateConstructorUsedError;
  String? get currency_symbol => throw _privateConstructorUsedError;
  String? get tld => throw _privateConstructorUsedError;
  String? get native => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get subregion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClsCountriesJsonCopyWith<ClsCountriesJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClsCountriesJsonCopyWith<$Res> {
  factory $ClsCountriesJsonCopyWith(
          ClsCountriesJson value, $Res Function(ClsCountriesJson) then) =
      _$ClsCountriesJsonCopyWithImpl<$Res, ClsCountriesJson>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? iso3,
      String? iso2,
      String? numeric_code,
      String? phone_code,
      String? capital,
      String? currency,
      String? currency_name,
      String? currency_symbol,
      String? tld,
      String? native,
      String? region,
      String? subregion});
}

/// @nodoc
class _$ClsCountriesJsonCopyWithImpl<$Res, $Val extends ClsCountriesJson>
    implements $ClsCountriesJsonCopyWith<$Res> {
  _$ClsCountriesJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iso3 = freezed,
    Object? iso2 = freezed,
    Object? numeric_code = freezed,
    Object? phone_code = freezed,
    Object? capital = freezed,
    Object? currency = freezed,
    Object? currency_name = freezed,
    Object? currency_symbol = freezed,
    Object? tld = freezed,
    Object? native = freezed,
    Object? region = freezed,
    Object? subregion = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iso3: freezed == iso3
          ? _value.iso3
          : iso3 // ignore: cast_nullable_to_non_nullable
              as String?,
      iso2: freezed == iso2
          ? _value.iso2
          : iso2 // ignore: cast_nullable_to_non_nullable
              as String?,
      numeric_code: freezed == numeric_code
          ? _value.numeric_code
          : numeric_code // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_code: freezed == phone_code
          ? _value.phone_code
          : phone_code // ignore: cast_nullable_to_non_nullable
              as String?,
      capital: freezed == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currency_name: freezed == currency_name
          ? _value.currency_name
          : currency_name // ignore: cast_nullable_to_non_nullable
              as String?,
      currency_symbol: freezed == currency_symbol
          ? _value.currency_symbol
          : currency_symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      tld: freezed == tld
          ? _value.tld
          : tld // ignore: cast_nullable_to_non_nullable
              as String?,
      native: freezed == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      subregion: freezed == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClsCountriesJsonCopyWith<$Res>
    implements $ClsCountriesJsonCopyWith<$Res> {
  factory _$$_ClsCountriesJsonCopyWith(
          _$_ClsCountriesJson value, $Res Function(_$_ClsCountriesJson) then) =
      __$$_ClsCountriesJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? iso3,
      String? iso2,
      String? numeric_code,
      String? phone_code,
      String? capital,
      String? currency,
      String? currency_name,
      String? currency_symbol,
      String? tld,
      String? native,
      String? region,
      String? subregion});
}

/// @nodoc
class __$$_ClsCountriesJsonCopyWithImpl<$Res>
    extends _$ClsCountriesJsonCopyWithImpl<$Res, _$_ClsCountriesJson>
    implements _$$_ClsCountriesJsonCopyWith<$Res> {
  __$$_ClsCountriesJsonCopyWithImpl(
      _$_ClsCountriesJson _value, $Res Function(_$_ClsCountriesJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iso3 = freezed,
    Object? iso2 = freezed,
    Object? numeric_code = freezed,
    Object? phone_code = freezed,
    Object? capital = freezed,
    Object? currency = freezed,
    Object? currency_name = freezed,
    Object? currency_symbol = freezed,
    Object? tld = freezed,
    Object? native = freezed,
    Object? region = freezed,
    Object? subregion = freezed,
  }) {
    return _then(_$_ClsCountriesJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iso3: freezed == iso3
          ? _value.iso3
          : iso3 // ignore: cast_nullable_to_non_nullable
              as String?,
      iso2: freezed == iso2
          ? _value.iso2
          : iso2 // ignore: cast_nullable_to_non_nullable
              as String?,
      numeric_code: freezed == numeric_code
          ? _value.numeric_code
          : numeric_code // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_code: freezed == phone_code
          ? _value.phone_code
          : phone_code // ignore: cast_nullable_to_non_nullable
              as String?,
      capital: freezed == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      currency_name: freezed == currency_name
          ? _value.currency_name
          : currency_name // ignore: cast_nullable_to_non_nullable
              as String?,
      currency_symbol: freezed == currency_symbol
          ? _value.currency_symbol
          : currency_symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      tld: freezed == tld
          ? _value.tld
          : tld // ignore: cast_nullable_to_non_nullable
              as String?,
      native: freezed == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      subregion: freezed == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClsCountriesJson implements _ClsCountriesJson {
  const _$_ClsCountriesJson(
      {this.id,
      this.name,
      this.iso3,
      this.iso2,
      this.numeric_code,
      this.phone_code,
      this.capital,
      this.currency,
      this.currency_name,
      this.currency_symbol,
      this.tld,
      this.native,
      this.region,
      this.subregion});

  factory _$_ClsCountriesJson.fromJson(Map<String, dynamic> json) =>
      _$$_ClsCountriesJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? iso3;
  @override
  final String? iso2;
  @override
  final String? numeric_code;
  @override
  final String? phone_code;
  @override
  final String? capital;
  @override
  final String? currency;
  @override
  final String? currency_name;
  @override
  final String? currency_symbol;
  @override
  final String? tld;
  @override
  final String? native;
  @override
  final String? region;
  @override
  final String? subregion;

  @override
  String toString() {
    return 'ClsCountriesJson(id: $id, name: $name, iso3: $iso3, iso2: $iso2, numeric_code: $numeric_code, phone_code: $phone_code, capital: $capital, currency: $currency, currency_name: $currency_name, currency_symbol: $currency_symbol, tld: $tld, native: $native, region: $region, subregion: $subregion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClsCountriesJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iso3, iso3) || other.iso3 == iso3) &&
            (identical(other.iso2, iso2) || other.iso2 == iso2) &&
            (identical(other.numeric_code, numeric_code) ||
                other.numeric_code == numeric_code) &&
            (identical(other.phone_code, phone_code) ||
                other.phone_code == phone_code) &&
            (identical(other.capital, capital) || other.capital == capital) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.currency_name, currency_name) ||
                other.currency_name == currency_name) &&
            (identical(other.currency_symbol, currency_symbol) ||
                other.currency_symbol == currency_symbol) &&
            (identical(other.tld, tld) || other.tld == tld) &&
            (identical(other.native, native) || other.native == native) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.subregion, subregion) ||
                other.subregion == subregion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      iso3,
      iso2,
      numeric_code,
      phone_code,
      capital,
      currency,
      currency_name,
      currency_symbol,
      tld,
      native,
      region,
      subregion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClsCountriesJsonCopyWith<_$_ClsCountriesJson> get copyWith =>
      __$$_ClsCountriesJsonCopyWithImpl<_$_ClsCountriesJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClsCountriesJsonToJson(
      this,
    );
  }
}

abstract class _ClsCountriesJson implements ClsCountriesJson {
  const factory _ClsCountriesJson(
      {final int? id,
      final String? name,
      final String? iso3,
      final String? iso2,
      final String? numeric_code,
      final String? phone_code,
      final String? capital,
      final String? currency,
      final String? currency_name,
      final String? currency_symbol,
      final String? tld,
      final String? native,
      final String? region,
      final String? subregion}) = _$_ClsCountriesJson;

  factory _ClsCountriesJson.fromJson(Map<String, dynamic> json) =
      _$_ClsCountriesJson.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get iso3;
  @override
  String? get iso2;
  @override
  String? get numeric_code;
  @override
  String? get phone_code;
  @override
  String? get capital;
  @override
  String? get currency;
  @override
  String? get currency_name;
  @override
  String? get currency_symbol;
  @override
  String? get tld;
  @override
  String? get native;
  @override
  String? get region;
  @override
  String? get subregion;
  @override
  @JsonKey(ignore: true)
  _$$_ClsCountriesJsonCopyWith<_$_ClsCountriesJson> get copyWith =>
      throw _privateConstructorUsedError;
}

StateResponse _$StateResponseFromJson(Map<String, dynamic> json) {
  return _StateResponse.fromJson(json);
}

/// @nodoc
mixin _$StateResponse {
  List<ClsStatesJson>? get objState => throw _privateConstructorUsedError;
  bool? get status => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateResponseCopyWith<StateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateResponseCopyWith<$Res> {
  factory $StateResponseCopyWith(
          StateResponse value, $Res Function(StateResponse) then) =
      _$StateResponseCopyWithImpl<$Res, StateResponse>;
  @useResult
  $Res call(
      {List<ClsStatesJson>? objState, bool? status, String? responseMessage});
}

/// @nodoc
class _$StateResponseCopyWithImpl<$Res, $Val extends StateResponse>
    implements $StateResponseCopyWith<$Res> {
  _$StateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objState = freezed,
    Object? status = freezed,
    Object? responseMessage = freezed,
  }) {
    return _then(_value.copyWith(
      objState: freezed == objState
          ? _value.objState
          : objState // ignore: cast_nullable_to_non_nullable
              as List<ClsStatesJson>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateResponseCopyWith<$Res>
    implements $StateResponseCopyWith<$Res> {
  factory _$$_StateResponseCopyWith(
          _$_StateResponse value, $Res Function(_$_StateResponse) then) =
      __$$_StateResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ClsStatesJson>? objState, bool? status, String? responseMessage});
}

/// @nodoc
class __$$_StateResponseCopyWithImpl<$Res>
    extends _$StateResponseCopyWithImpl<$Res, _$_StateResponse>
    implements _$$_StateResponseCopyWith<$Res> {
  __$$_StateResponseCopyWithImpl(
      _$_StateResponse _value, $Res Function(_$_StateResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objState = freezed,
    Object? status = freezed,
    Object? responseMessage = freezed,
  }) {
    return _then(_$_StateResponse(
      objState: freezed == objState
          ? _value._objState
          : objState // ignore: cast_nullable_to_non_nullable
              as List<ClsStatesJson>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StateResponse implements _StateResponse {
  const _$_StateResponse(
      {final List<ClsStatesJson>? objState, this.status, this.responseMessage})
      : _objState = objState;

  factory _$_StateResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StateResponseFromJson(json);

  final List<ClsStatesJson>? _objState;
  @override
  List<ClsStatesJson>? get objState {
    final value = _objState;
    if (value == null) return null;
    if (_objState is EqualUnmodifiableListView) return _objState;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? status;
  @override
  final String? responseMessage;

  @override
  String toString() {
    return 'StateResponse(objState: $objState, status: $status, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StateResponse &&
            const DeepCollectionEquality().equals(other._objState, _objState) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_objState), status, responseMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateResponseCopyWith<_$_StateResponse> get copyWith =>
      __$$_StateResponseCopyWithImpl<_$_StateResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateResponseToJson(
      this,
    );
  }
}

abstract class _StateResponse implements StateResponse {
  const factory _StateResponse(
      {final List<ClsStatesJson>? objState,
      final bool? status,
      final String? responseMessage}) = _$_StateResponse;

  factory _StateResponse.fromJson(Map<String, dynamic> json) =
      _$_StateResponse.fromJson;

  @override
  List<ClsStatesJson>? get objState;
  @override
  bool? get status;
  @override
  String? get responseMessage;
  @override
  @JsonKey(ignore: true)
  _$$_StateResponseCopyWith<_$_StateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

ClsStatesJson _$ClsStatesJsonFromJson(Map<String, dynamic> json) {
  return _ClsStatesJson.fromJson(json);
}

/// @nodoc
mixin _$ClsStatesJson {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get country_id => throw _privateConstructorUsedError;
  String? get country_code => throw _privateConstructorUsedError;
  String? get country_name => throw _privateConstructorUsedError;
  String? get state_code => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClsStatesJsonCopyWith<ClsStatesJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClsStatesJsonCopyWith<$Res> {
  factory $ClsStatesJsonCopyWith(
          ClsStatesJson value, $Res Function(ClsStatesJson) then) =
      _$ClsStatesJsonCopyWithImpl<$Res, ClsStatesJson>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? country_id,
      String? country_code,
      String? country_name,
      String? state_code,
      String? type,
      String? latitude,
      String? longitude});
}

/// @nodoc
class _$ClsStatesJsonCopyWithImpl<$Res, $Val extends ClsStatesJson>
    implements $ClsStatesJsonCopyWith<$Res> {
  _$ClsStatesJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? country_id = freezed,
    Object? country_code = freezed,
    Object? country_name = freezed,
    Object? state_code = freezed,
    Object? type = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country_id: freezed == country_id
          ? _value.country_id
          : country_id // ignore: cast_nullable_to_non_nullable
              as int?,
      country_code: freezed == country_code
          ? _value.country_code
          : country_code // ignore: cast_nullable_to_non_nullable
              as String?,
      country_name: freezed == country_name
          ? _value.country_name
          : country_name // ignore: cast_nullable_to_non_nullable
              as String?,
      state_code: freezed == state_code
          ? _value.state_code
          : state_code // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClsStatesJsonCopyWith<$Res>
    implements $ClsStatesJsonCopyWith<$Res> {
  factory _$$_ClsStatesJsonCopyWith(
          _$_ClsStatesJson value, $Res Function(_$_ClsStatesJson) then) =
      __$$_ClsStatesJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? country_id,
      String? country_code,
      String? country_name,
      String? state_code,
      String? type,
      String? latitude,
      String? longitude});
}

/// @nodoc
class __$$_ClsStatesJsonCopyWithImpl<$Res>
    extends _$ClsStatesJsonCopyWithImpl<$Res, _$_ClsStatesJson>
    implements _$$_ClsStatesJsonCopyWith<$Res> {
  __$$_ClsStatesJsonCopyWithImpl(
      _$_ClsStatesJson _value, $Res Function(_$_ClsStatesJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? country_id = freezed,
    Object? country_code = freezed,
    Object? country_name = freezed,
    Object? state_code = freezed,
    Object? type = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$_ClsStatesJson(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country_id: freezed == country_id
          ? _value.country_id
          : country_id // ignore: cast_nullable_to_non_nullable
              as int?,
      country_code: freezed == country_code
          ? _value.country_code
          : country_code // ignore: cast_nullable_to_non_nullable
              as String?,
      country_name: freezed == country_name
          ? _value.country_name
          : country_name // ignore: cast_nullable_to_non_nullable
              as String?,
      state_code: freezed == state_code
          ? _value.state_code
          : state_code // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClsStatesJson implements _ClsStatesJson {
  const _$_ClsStatesJson(
      {this.id,
      this.name,
      this.country_id,
      this.country_code,
      this.country_name,
      this.state_code,
      this.type,
      this.latitude,
      this.longitude});

  factory _$_ClsStatesJson.fromJson(Map<String, dynamic> json) =>
      _$$_ClsStatesJsonFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? country_id;
  @override
  final String? country_code;
  @override
  final String? country_name;
  @override
  final String? state_code;
  @override
  final String? type;
  @override
  final String? latitude;
  @override
  final String? longitude;

  @override
  String toString() {
    return 'ClsStatesJson(id: $id, name: $name, country_id: $country_id, country_code: $country_code, country_name: $country_name, state_code: $state_code, type: $type, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClsStatesJson &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country_id, country_id) ||
                other.country_id == country_id) &&
            (identical(other.country_code, country_code) ||
                other.country_code == country_code) &&
            (identical(other.country_name, country_name) ||
                other.country_name == country_name) &&
            (identical(other.state_code, state_code) ||
                other.state_code == state_code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, country_id,
      country_code, country_name, state_code, type, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClsStatesJsonCopyWith<_$_ClsStatesJson> get copyWith =>
      __$$_ClsStatesJsonCopyWithImpl<_$_ClsStatesJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClsStatesJsonToJson(
      this,
    );
  }
}

abstract class _ClsStatesJson implements ClsStatesJson {
  const factory _ClsStatesJson(
      {final int? id,
      final String? name,
      final int? country_id,
      final String? country_code,
      final String? country_name,
      final String? state_code,
      final String? type,
      final String? latitude,
      final String? longitude}) = _$_ClsStatesJson;

  factory _ClsStatesJson.fromJson(Map<String, dynamic> json) =
      _$_ClsStatesJson.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get country_id;
  @override
  String? get country_code;
  @override
  String? get country_name;
  @override
  String? get state_code;
  @override
  String? get type;
  @override
  String? get latitude;
  @override
  String? get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_ClsStatesJsonCopyWith<_$_ClsStatesJson> get copyWith =>
      throw _privateConstructorUsedError;
}
