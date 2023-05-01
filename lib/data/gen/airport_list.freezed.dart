// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../model/airport_list.dart';

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
