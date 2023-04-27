// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../model/My Trip/flights.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AirlineTicketHistoryResponse _$AirlineTicketHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return _AirlineTicketHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$AirlineTicketHistoryResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;
  List<AirlineTicketHistory>? get objAirlineTicketHistory =>
      throw _privateConstructorUsedError;
  String? get statusType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirlineTicketHistoryResponseCopyWith<AirlineTicketHistoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirlineTicketHistoryResponseCopyWith<$Res> {
  factory $AirlineTicketHistoryResponseCopyWith(
          AirlineTicketHistoryResponse value,
          $Res Function(AirlineTicketHistoryResponse) then) =
      _$AirlineTicketHistoryResponseCopyWithImpl<$Res,
          AirlineTicketHistoryResponse>;
  @useResult
  $Res call(
      {bool? status,
      String? responseMessage,
      List<AirlineTicketHistory>? objAirlineTicketHistory,
      String? statusType});
}

/// @nodoc
class _$AirlineTicketHistoryResponseCopyWithImpl<$Res,
        $Val extends AirlineTicketHistoryResponse>
    implements $AirlineTicketHistoryResponseCopyWith<$Res> {
  _$AirlineTicketHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
    Object? objAirlineTicketHistory = freezed,
    Object? statusType = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      objAirlineTicketHistory: freezed == objAirlineTicketHistory
          ? _value.objAirlineTicketHistory
          : objAirlineTicketHistory // ignore: cast_nullable_to_non_nullable
              as List<AirlineTicketHistory>?,
      statusType: freezed == statusType
          ? _value.statusType
          : statusType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AirlineTicketHistoryResponseCopyWith<$Res>
    implements $AirlineTicketHistoryResponseCopyWith<$Res> {
  factory _$$_AirlineTicketHistoryResponseCopyWith(
          _$_AirlineTicketHistoryResponse value,
          $Res Function(_$_AirlineTicketHistoryResponse) then) =
      __$$_AirlineTicketHistoryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status,
      String? responseMessage,
      List<AirlineTicketHistory>? objAirlineTicketHistory,
      String? statusType});
}

/// @nodoc
class __$$_AirlineTicketHistoryResponseCopyWithImpl<$Res>
    extends _$AirlineTicketHistoryResponseCopyWithImpl<$Res,
        _$_AirlineTicketHistoryResponse>
    implements _$$_AirlineTicketHistoryResponseCopyWith<$Res> {
  __$$_AirlineTicketHistoryResponseCopyWithImpl(
      _$_AirlineTicketHistoryResponse _value,
      $Res Function(_$_AirlineTicketHistoryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
    Object? objAirlineTicketHistory = freezed,
    Object? statusType = freezed,
  }) {
    return _then(_$_AirlineTicketHistoryResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      objAirlineTicketHistory: freezed == objAirlineTicketHistory
          ? _value._objAirlineTicketHistory
          : objAirlineTicketHistory // ignore: cast_nullable_to_non_nullable
              as List<AirlineTicketHistory>?,
      statusType: freezed == statusType
          ? _value.statusType
          : statusType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AirlineTicketHistoryResponse implements _AirlineTicketHistoryResponse {
  const _$_AirlineTicketHistoryResponse(
      {this.status,
      this.responseMessage,
      final List<AirlineTicketHistory>? objAirlineTicketHistory,
      this.statusType})
      : _objAirlineTicketHistory = objAirlineTicketHistory;

  factory _$_AirlineTicketHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AirlineTicketHistoryResponseFromJson(json);

  @override
  final bool? status;
  @override
  final String? responseMessage;
  final List<AirlineTicketHistory>? _objAirlineTicketHistory;
  @override
  List<AirlineTicketHistory>? get objAirlineTicketHistory {
    final value = _objAirlineTicketHistory;
    if (value == null) return null;
    if (_objAirlineTicketHistory is EqualUnmodifiableListView)
      return _objAirlineTicketHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? statusType;

  @override
  String toString() {
    return 'AirlineTicketHistoryResponse(status: $status, responseMessage: $responseMessage, objAirlineTicketHistory: $objAirlineTicketHistory, statusType: $statusType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AirlineTicketHistoryResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage) &&
            const DeepCollectionEquality().equals(
                other._objAirlineTicketHistory, _objAirlineTicketHistory) &&
            (identical(other.statusType, statusType) ||
                other.statusType == statusType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      responseMessage,
      const DeepCollectionEquality().hash(_objAirlineTicketHistory),
      statusType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AirlineTicketHistoryResponseCopyWith<_$_AirlineTicketHistoryResponse>
      get copyWith => __$$_AirlineTicketHistoryResponseCopyWithImpl<
          _$_AirlineTicketHistoryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AirlineTicketHistoryResponseToJson(
      this,
    );
  }
}

abstract class _AirlineTicketHistoryResponse
    implements AirlineTicketHistoryResponse {
  const factory _AirlineTicketHistoryResponse(
      {final bool? status,
      final String? responseMessage,
      final List<AirlineTicketHistory>? objAirlineTicketHistory,
      final String? statusType}) = _$_AirlineTicketHistoryResponse;

  factory _AirlineTicketHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$_AirlineTicketHistoryResponse.fromJson;

  @override
  bool? get status;
  @override
  String? get responseMessage;
  @override
  List<AirlineTicketHistory>? get objAirlineTicketHistory;
  @override
  String? get statusType;
  @override
  @JsonKey(ignore: true)
  _$$_AirlineTicketHistoryResponseCopyWith<_$_AirlineTicketHistoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

AirlineTicketHistory _$AirlineTicketHistoryFromJson(Map<String, dynamic> json) {
  return _AirlineTicketHistory.fromJson(json);
}

/// @nodoc
mixin _$AirlineTicketHistory {
  String? get alhindPnr => throw _privateConstructorUsedError;
  String? get airlinePnr => throw _privateConstructorUsedError;
  String? get bookingType => throw _privateConstructorUsedError;
  String? get airlineName => throw _privateConstructorUsedError;
  String? get leadPassenger => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  String? get destination => throw _privateConstructorUsedError;
  DateTime? get bookingDate => throw _privateConstructorUsedError;
  DateTime? get departureDate => throw _privateConstructorUsedError;
  DateTime? get arrivalDate => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get airlineCode => throw _privateConstructorUsedError;
  String? get flightNo => throw _privateConstructorUsedError;
  String? get fromCity => throw _privateConstructorUsedError;
  String? get toCity => throw _privateConstructorUsedError;
  String? get startTerminal => throw _privateConstructorUsedError;
  String? get endTerminal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirlineTicketHistoryCopyWith<AirlineTicketHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirlineTicketHistoryCopyWith<$Res> {
  factory $AirlineTicketHistoryCopyWith(AirlineTicketHistory value,
          $Res Function(AirlineTicketHistory) then) =
      _$AirlineTicketHistoryCopyWithImpl<$Res, AirlineTicketHistory>;
  @useResult
  $Res call(
      {String? alhindPnr,
      String? airlinePnr,
      String? bookingType,
      String? airlineName,
      String? leadPassenger,
      String? origin,
      String? destination,
      DateTime? bookingDate,
      DateTime? departureDate,
      DateTime? arrivalDate,
      double? totalAmount,
      String? status,
      String? airlineCode,
      String? flightNo,
      String? fromCity,
      String? toCity,
      String? startTerminal,
      String? endTerminal});
}

/// @nodoc
class _$AirlineTicketHistoryCopyWithImpl<$Res,
        $Val extends AirlineTicketHistory>
    implements $AirlineTicketHistoryCopyWith<$Res> {
  _$AirlineTicketHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alhindPnr = freezed,
    Object? airlinePnr = freezed,
    Object? bookingType = freezed,
    Object? airlineName = freezed,
    Object? leadPassenger = freezed,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? bookingDate = freezed,
    Object? departureDate = freezed,
    Object? arrivalDate = freezed,
    Object? totalAmount = freezed,
    Object? status = freezed,
    Object? airlineCode = freezed,
    Object? flightNo = freezed,
    Object? fromCity = freezed,
    Object? toCity = freezed,
    Object? startTerminal = freezed,
    Object? endTerminal = freezed,
  }) {
    return _then(_value.copyWith(
      alhindPnr: freezed == alhindPnr
          ? _value.alhindPnr
          : alhindPnr // ignore: cast_nullable_to_non_nullable
              as String?,
      airlinePnr: freezed == airlinePnr
          ? _value.airlinePnr
          : airlinePnr // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingType: freezed == bookingType
          ? _value.bookingType
          : bookingType // ignore: cast_nullable_to_non_nullable
              as String?,
      airlineName: freezed == airlineName
          ? _value.airlineName
          : airlineName // ignore: cast_nullable_to_non_nullable
              as String?,
      leadPassenger: freezed == leadPassenger
          ? _value.leadPassenger
          : leadPassenger // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingDate: freezed == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      arrivalDate: freezed == arrivalDate
          ? _value.arrivalDate
          : arrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      airlineCode: freezed == airlineCode
          ? _value.airlineCode
          : airlineCode // ignore: cast_nullable_to_non_nullable
              as String?,
      flightNo: freezed == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String?,
      fromCity: freezed == fromCity
          ? _value.fromCity
          : fromCity // ignore: cast_nullable_to_non_nullable
              as String?,
      toCity: freezed == toCity
          ? _value.toCity
          : toCity // ignore: cast_nullable_to_non_nullable
              as String?,
      startTerminal: freezed == startTerminal
          ? _value.startTerminal
          : startTerminal // ignore: cast_nullable_to_non_nullable
              as String?,
      endTerminal: freezed == endTerminal
          ? _value.endTerminal
          : endTerminal // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AirlineTicketHistoryCopyWith<$Res>
    implements $AirlineTicketHistoryCopyWith<$Res> {
  factory _$$_AirlineTicketHistoryCopyWith(_$_AirlineTicketHistory value,
          $Res Function(_$_AirlineTicketHistory) then) =
      __$$_AirlineTicketHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? alhindPnr,
      String? airlinePnr,
      String? bookingType,
      String? airlineName,
      String? leadPassenger,
      String? origin,
      String? destination,
      DateTime? bookingDate,
      DateTime? departureDate,
      DateTime? arrivalDate,
      double? totalAmount,
      String? status,
      String? airlineCode,
      String? flightNo,
      String? fromCity,
      String? toCity,
      String? startTerminal,
      String? endTerminal});
}

/// @nodoc
class __$$_AirlineTicketHistoryCopyWithImpl<$Res>
    extends _$AirlineTicketHistoryCopyWithImpl<$Res, _$_AirlineTicketHistory>
    implements _$$_AirlineTicketHistoryCopyWith<$Res> {
  __$$_AirlineTicketHistoryCopyWithImpl(_$_AirlineTicketHistory _value,
      $Res Function(_$_AirlineTicketHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alhindPnr = freezed,
    Object? airlinePnr = freezed,
    Object? bookingType = freezed,
    Object? airlineName = freezed,
    Object? leadPassenger = freezed,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? bookingDate = freezed,
    Object? departureDate = freezed,
    Object? arrivalDate = freezed,
    Object? totalAmount = freezed,
    Object? status = freezed,
    Object? airlineCode = freezed,
    Object? flightNo = freezed,
    Object? fromCity = freezed,
    Object? toCity = freezed,
    Object? startTerminal = freezed,
    Object? endTerminal = freezed,
  }) {
    return _then(_$_AirlineTicketHistory(
      alhindPnr: freezed == alhindPnr
          ? _value.alhindPnr
          : alhindPnr // ignore: cast_nullable_to_non_nullable
              as String?,
      airlinePnr: freezed == airlinePnr
          ? _value.airlinePnr
          : airlinePnr // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingType: freezed == bookingType
          ? _value.bookingType
          : bookingType // ignore: cast_nullable_to_non_nullable
              as String?,
      airlineName: freezed == airlineName
          ? _value.airlineName
          : airlineName // ignore: cast_nullable_to_non_nullable
              as String?,
      leadPassenger: freezed == leadPassenger
          ? _value.leadPassenger
          : leadPassenger // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingDate: freezed == bookingDate
          ? _value.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      arrivalDate: freezed == arrivalDate
          ? _value.arrivalDate
          : arrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      airlineCode: freezed == airlineCode
          ? _value.airlineCode
          : airlineCode // ignore: cast_nullable_to_non_nullable
              as String?,
      flightNo: freezed == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String?,
      fromCity: freezed == fromCity
          ? _value.fromCity
          : fromCity // ignore: cast_nullable_to_non_nullable
              as String?,
      toCity: freezed == toCity
          ? _value.toCity
          : toCity // ignore: cast_nullable_to_non_nullable
              as String?,
      startTerminal: freezed == startTerminal
          ? _value.startTerminal
          : startTerminal // ignore: cast_nullable_to_non_nullable
              as String?,
      endTerminal: freezed == endTerminal
          ? _value.endTerminal
          : endTerminal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AirlineTicketHistory implements _AirlineTicketHistory {
  const _$_AirlineTicketHistory(
      {this.alhindPnr,
      this.airlinePnr,
      this.bookingType,
      this.airlineName,
      this.leadPassenger,
      this.origin,
      this.destination,
      this.bookingDate,
      this.departureDate,
      this.arrivalDate,
      this.totalAmount,
      this.status,
      this.airlineCode,
      this.flightNo,
      this.fromCity,
      this.toCity,
      this.startTerminal,
      this.endTerminal});

  factory _$_AirlineTicketHistory.fromJson(Map<String, dynamic> json) =>
      _$$_AirlineTicketHistoryFromJson(json);

  @override
  final String? alhindPnr;
  @override
  final String? airlinePnr;
  @override
  final String? bookingType;
  @override
  final String? airlineName;
  @override
  final String? leadPassenger;
  @override
  final String? origin;
  @override
  final String? destination;
  @override
  final DateTime? bookingDate;
  @override
  final DateTime? departureDate;
  @override
  final DateTime? arrivalDate;
  @override
  final double? totalAmount;
  @override
  final String? status;
  @override
  final String? airlineCode;
  @override
  final String? flightNo;
  @override
  final String? fromCity;
  @override
  final String? toCity;
  @override
  final String? startTerminal;
  @override
  final String? endTerminal;

  @override
  String toString() {
    return 'AirlineTicketHistory(alhindPnr: $alhindPnr, airlinePnr: $airlinePnr, bookingType: $bookingType, airlineName: $airlineName, leadPassenger: $leadPassenger, origin: $origin, destination: $destination, bookingDate: $bookingDate, departureDate: $departureDate, arrivalDate: $arrivalDate, totalAmount: $totalAmount, status: $status, airlineCode: $airlineCode, flightNo: $flightNo, fromCity: $fromCity, toCity: $toCity, startTerminal: $startTerminal, endTerminal: $endTerminal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AirlineTicketHistory &&
            (identical(other.alhindPnr, alhindPnr) ||
                other.alhindPnr == alhindPnr) &&
            (identical(other.airlinePnr, airlinePnr) ||
                other.airlinePnr == airlinePnr) &&
            (identical(other.bookingType, bookingType) ||
                other.bookingType == bookingType) &&
            (identical(other.airlineName, airlineName) ||
                other.airlineName == airlineName) &&
            (identical(other.leadPassenger, leadPassenger) ||
                other.leadPassenger == leadPassenger) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.bookingDate, bookingDate) ||
                other.bookingDate == bookingDate) &&
            (identical(other.departureDate, departureDate) ||
                other.departureDate == departureDate) &&
            (identical(other.arrivalDate, arrivalDate) ||
                other.arrivalDate == arrivalDate) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.airlineCode, airlineCode) ||
                other.airlineCode == airlineCode) &&
            (identical(other.flightNo, flightNo) ||
                other.flightNo == flightNo) &&
            (identical(other.fromCity, fromCity) ||
                other.fromCity == fromCity) &&
            (identical(other.toCity, toCity) || other.toCity == toCity) &&
            (identical(other.startTerminal, startTerminal) ||
                other.startTerminal == startTerminal) &&
            (identical(other.endTerminal, endTerminal) ||
                other.endTerminal == endTerminal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      alhindPnr,
      airlinePnr,
      bookingType,
      airlineName,
      leadPassenger,
      origin,
      destination,
      bookingDate,
      departureDate,
      arrivalDate,
      totalAmount,
      status,
      airlineCode,
      flightNo,
      fromCity,
      toCity,
      startTerminal,
      endTerminal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AirlineTicketHistoryCopyWith<_$_AirlineTicketHistory> get copyWith =>
      __$$_AirlineTicketHistoryCopyWithImpl<_$_AirlineTicketHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AirlineTicketHistoryToJson(
      this,
    );
  }
}

abstract class _AirlineTicketHistory implements AirlineTicketHistory {
  const factory _AirlineTicketHistory(
      {final String? alhindPnr,
      final String? airlinePnr,
      final String? bookingType,
      final String? airlineName,
      final String? leadPassenger,
      final String? origin,
      final String? destination,
      final DateTime? bookingDate,
      final DateTime? departureDate,
      final DateTime? arrivalDate,
      final double? totalAmount,
      final String? status,
      final String? airlineCode,
      final String? flightNo,
      final String? fromCity,
      final String? toCity,
      final String? startTerminal,
      final String? endTerminal}) = _$_AirlineTicketHistory;

  factory _AirlineTicketHistory.fromJson(Map<String, dynamic> json) =
      _$_AirlineTicketHistory.fromJson;

  @override
  String? get alhindPnr;
  @override
  String? get airlinePnr;
  @override
  String? get bookingType;
  @override
  String? get airlineName;
  @override
  String? get leadPassenger;
  @override
  String? get origin;
  @override
  String? get destination;
  @override
  DateTime? get bookingDate;
  @override
  DateTime? get departureDate;
  @override
  DateTime? get arrivalDate;
  @override
  double? get totalAmount;
  @override
  String? get status;
  @override
  String? get airlineCode;
  @override
  String? get flightNo;
  @override
  String? get fromCity;
  @override
  String? get toCity;
  @override
  String? get startTerminal;
  @override
  String? get endTerminal;
  @override
  @JsonKey(ignore: true)
  _$$_AirlineTicketHistoryCopyWith<_$_AirlineTicketHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
