// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../model/My Trip/my_trips.dart';

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
  int? get ItinId => throw _privateConstructorUsedError;
  String? get sectorData => throw _privateConstructorUsedError;
  String? get bookingType => throw _privateConstructorUsedError;
  String? get bookingReferenceId => throw _privateConstructorUsedError;
  String? get airlinePnr => throw _privateConstructorUsedError;
  double? get TotalAmount => throw _privateConstructorUsedError;
  List<AirlineTicketHistoryDetails>? get objSegDetails =>
      throw _privateConstructorUsedError;
  List<String>? get objPaxDetails => throw _privateConstructorUsedError;

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
      {int? ItinId,
      String? sectorData,
      String? bookingType,
      String? bookingReferenceId,
      String? airlinePnr,
      double? TotalAmount,
      List<AirlineTicketHistoryDetails>? objSegDetails,
      List<String>? objPaxDetails});
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
    Object? ItinId = freezed,
    Object? sectorData = freezed,
    Object? bookingType = freezed,
    Object? bookingReferenceId = freezed,
    Object? airlinePnr = freezed,
    Object? TotalAmount = freezed,
    Object? objSegDetails = freezed,
    Object? objPaxDetails = freezed,
  }) {
    return _then(_value.copyWith(
      ItinId: freezed == ItinId
          ? _value.ItinId
          : ItinId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectorData: freezed == sectorData
          ? _value.sectorData
          : sectorData // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingType: freezed == bookingType
          ? _value.bookingType
          : bookingType // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingReferenceId: freezed == bookingReferenceId
          ? _value.bookingReferenceId
          : bookingReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      airlinePnr: freezed == airlinePnr
          ? _value.airlinePnr
          : airlinePnr // ignore: cast_nullable_to_non_nullable
              as String?,
      TotalAmount: freezed == TotalAmount
          ? _value.TotalAmount
          : TotalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      objSegDetails: freezed == objSegDetails
          ? _value.objSegDetails
          : objSegDetails // ignore: cast_nullable_to_non_nullable
              as List<AirlineTicketHistoryDetails>?,
      objPaxDetails: freezed == objPaxDetails
          ? _value.objPaxDetails
          : objPaxDetails // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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
      {int? ItinId,
      String? sectorData,
      String? bookingType,
      String? bookingReferenceId,
      String? airlinePnr,
      double? TotalAmount,
      List<AirlineTicketHistoryDetails>? objSegDetails,
      List<String>? objPaxDetails});
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
    Object? ItinId = freezed,
    Object? sectorData = freezed,
    Object? bookingType = freezed,
    Object? bookingReferenceId = freezed,
    Object? airlinePnr = freezed,
    Object? TotalAmount = freezed,
    Object? objSegDetails = freezed,
    Object? objPaxDetails = freezed,
  }) {
    return _then(_$_AirlineTicketHistory(
      ItinId: freezed == ItinId
          ? _value.ItinId
          : ItinId // ignore: cast_nullable_to_non_nullable
              as int?,
      sectorData: freezed == sectorData
          ? _value.sectorData
          : sectorData // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingType: freezed == bookingType
          ? _value.bookingType
          : bookingType // ignore: cast_nullable_to_non_nullable
              as String?,
      bookingReferenceId: freezed == bookingReferenceId
          ? _value.bookingReferenceId
          : bookingReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      airlinePnr: freezed == airlinePnr
          ? _value.airlinePnr
          : airlinePnr // ignore: cast_nullable_to_non_nullable
              as String?,
      TotalAmount: freezed == TotalAmount
          ? _value.TotalAmount
          : TotalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      objSegDetails: freezed == objSegDetails
          ? _value._objSegDetails
          : objSegDetails // ignore: cast_nullable_to_non_nullable
              as List<AirlineTicketHistoryDetails>?,
      objPaxDetails: freezed == objPaxDetails
          ? _value._objPaxDetails
          : objPaxDetails // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AirlineTicketHistory implements _AirlineTicketHistory {
  const _$_AirlineTicketHistory(
      {this.ItinId,
      this.sectorData,
      this.bookingType,
      this.bookingReferenceId,
      this.airlinePnr,
      this.TotalAmount,
      final List<AirlineTicketHistoryDetails>? objSegDetails,
      final List<String>? objPaxDetails})
      : _objSegDetails = objSegDetails,
        _objPaxDetails = objPaxDetails;

  factory _$_AirlineTicketHistory.fromJson(Map<String, dynamic> json) =>
      _$$_AirlineTicketHistoryFromJson(json);

  @override
  final int? ItinId;
  @override
  final String? sectorData;
  @override
  final String? bookingType;
  @override
  final String? bookingReferenceId;
  @override
  final String? airlinePnr;
  @override
  final double? TotalAmount;
  final List<AirlineTicketHistoryDetails>? _objSegDetails;
  @override
  List<AirlineTicketHistoryDetails>? get objSegDetails {
    final value = _objSegDetails;
    if (value == null) return null;
    if (_objSegDetails is EqualUnmodifiableListView) return _objSegDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _objPaxDetails;
  @override
  List<String>? get objPaxDetails {
    final value = _objPaxDetails;
    if (value == null) return null;
    if (_objPaxDetails is EqualUnmodifiableListView) return _objPaxDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AirlineTicketHistory(ItinId: $ItinId, sectorData: $sectorData, bookingType: $bookingType, bookingReferenceId: $bookingReferenceId, airlinePnr: $airlinePnr, TotalAmount: $TotalAmount, objSegDetails: $objSegDetails, objPaxDetails: $objPaxDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AirlineTicketHistory &&
            (identical(other.ItinId, ItinId) || other.ItinId == ItinId) &&
            (identical(other.sectorData, sectorData) ||
                other.sectorData == sectorData) &&
            (identical(other.bookingType, bookingType) ||
                other.bookingType == bookingType) &&
            (identical(other.bookingReferenceId, bookingReferenceId) ||
                other.bookingReferenceId == bookingReferenceId) &&
            (identical(other.airlinePnr, airlinePnr) ||
                other.airlinePnr == airlinePnr) &&
            (identical(other.TotalAmount, TotalAmount) ||
                other.TotalAmount == TotalAmount) &&
            const DeepCollectionEquality()
                .equals(other._objSegDetails, _objSegDetails) &&
            const DeepCollectionEquality()
                .equals(other._objPaxDetails, _objPaxDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ItinId,
      sectorData,
      bookingType,
      bookingReferenceId,
      airlinePnr,
      TotalAmount,
      const DeepCollectionEquality().hash(_objSegDetails),
      const DeepCollectionEquality().hash(_objPaxDetails));

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
      {final int? ItinId,
      final String? sectorData,
      final String? bookingType,
      final String? bookingReferenceId,
      final String? airlinePnr,
      final double? TotalAmount,
      final List<AirlineTicketHistoryDetails>? objSegDetails,
      final List<String>? objPaxDetails}) = _$_AirlineTicketHistory;

  factory _AirlineTicketHistory.fromJson(Map<String, dynamic> json) =
      _$_AirlineTicketHistory.fromJson;

  @override
  int? get ItinId;
  @override
  String? get sectorData;
  @override
  String? get bookingType;
  @override
  String? get bookingReferenceId;
  @override
  String? get airlinePnr;
  @override
  double? get TotalAmount;
  @override
  List<AirlineTicketHistoryDetails>? get objSegDetails;
  @override
  List<String>? get objPaxDetails;
  @override
  @JsonKey(ignore: true)
  _$$_AirlineTicketHistoryCopyWith<_$_AirlineTicketHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

AirlineTicketHistoryDetails _$AirlineTicketHistoryDetailsFromJson(
    Map<String, dynamic> json) {
  return _AirlineTicketHistoryDetails.fromJson(json);
}

/// @nodoc
mixin _$AirlineTicketHistoryDetails {
  String? get departureDate => throw _privateConstructorUsedError;
  String? get departureAirportDetails => throw _privateConstructorUsedError;
  String? get departureTerminal => throw _privateConstructorUsedError;
  String? get arrivalDate => throw _privateConstructorUsedError;
  String? get arrivalAirportDetails => throw _privateConstructorUsedError;
  String? get arrivalTerminal => throw _privateConstructorUsedError;
  String? get airlineCode => throw _privateConstructorUsedError;
  String? get airlineName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AirlineTicketHistoryDetailsCopyWith<AirlineTicketHistoryDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AirlineTicketHistoryDetailsCopyWith<$Res> {
  factory $AirlineTicketHistoryDetailsCopyWith(
          AirlineTicketHistoryDetails value,
          $Res Function(AirlineTicketHistoryDetails) then) =
      _$AirlineTicketHistoryDetailsCopyWithImpl<$Res,
          AirlineTicketHistoryDetails>;
  @useResult
  $Res call(
      {String? departureDate,
      String? departureAirportDetails,
      String? departureTerminal,
      String? arrivalDate,
      String? arrivalAirportDetails,
      String? arrivalTerminal,
      String? airlineCode,
      String? airlineName});
}

/// @nodoc
class _$AirlineTicketHistoryDetailsCopyWithImpl<$Res,
        $Val extends AirlineTicketHistoryDetails>
    implements $AirlineTicketHistoryDetailsCopyWith<$Res> {
  _$AirlineTicketHistoryDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departureDate = freezed,
    Object? departureAirportDetails = freezed,
    Object? departureTerminal = freezed,
    Object? arrivalDate = freezed,
    Object? arrivalAirportDetails = freezed,
    Object? arrivalTerminal = freezed,
    Object? airlineCode = freezed,
    Object? airlineName = freezed,
  }) {
    return _then(_value.copyWith(
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      departureAirportDetails: freezed == departureAirportDetails
          ? _value.departureAirportDetails
          : departureAirportDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      departureTerminal: freezed == departureTerminal
          ? _value.departureTerminal
          : departureTerminal // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalDate: freezed == arrivalDate
          ? _value.arrivalDate
          : arrivalDate // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalAirportDetails: freezed == arrivalAirportDetails
          ? _value.arrivalAirportDetails
          : arrivalAirportDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalTerminal: freezed == arrivalTerminal
          ? _value.arrivalTerminal
          : arrivalTerminal // ignore: cast_nullable_to_non_nullable
              as String?,
      airlineCode: freezed == airlineCode
          ? _value.airlineCode
          : airlineCode // ignore: cast_nullable_to_non_nullable
              as String?,
      airlineName: freezed == airlineName
          ? _value.airlineName
          : airlineName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AirlineTicketHistoryDetailsCopyWith<$Res>
    implements $AirlineTicketHistoryDetailsCopyWith<$Res> {
  factory _$$_AirlineTicketHistoryDetailsCopyWith(
          _$_AirlineTicketHistoryDetails value,
          $Res Function(_$_AirlineTicketHistoryDetails) then) =
      __$$_AirlineTicketHistoryDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? departureDate,
      String? departureAirportDetails,
      String? departureTerminal,
      String? arrivalDate,
      String? arrivalAirportDetails,
      String? arrivalTerminal,
      String? airlineCode,
      String? airlineName});
}

/// @nodoc
class __$$_AirlineTicketHistoryDetailsCopyWithImpl<$Res>
    extends _$AirlineTicketHistoryDetailsCopyWithImpl<$Res,
        _$_AirlineTicketHistoryDetails>
    implements _$$_AirlineTicketHistoryDetailsCopyWith<$Res> {
  __$$_AirlineTicketHistoryDetailsCopyWithImpl(
      _$_AirlineTicketHistoryDetails _value,
      $Res Function(_$_AirlineTicketHistoryDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departureDate = freezed,
    Object? departureAirportDetails = freezed,
    Object? departureTerminal = freezed,
    Object? arrivalDate = freezed,
    Object? arrivalAirportDetails = freezed,
    Object? arrivalTerminal = freezed,
    Object? airlineCode = freezed,
    Object? airlineName = freezed,
  }) {
    return _then(_$_AirlineTicketHistoryDetails(
      departureDate: freezed == departureDate
          ? _value.departureDate
          : departureDate // ignore: cast_nullable_to_non_nullable
              as String?,
      departureAirportDetails: freezed == departureAirportDetails
          ? _value.departureAirportDetails
          : departureAirportDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      departureTerminal: freezed == departureTerminal
          ? _value.departureTerminal
          : departureTerminal // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalDate: freezed == arrivalDate
          ? _value.arrivalDate
          : arrivalDate // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalAirportDetails: freezed == arrivalAirportDetails
          ? _value.arrivalAirportDetails
          : arrivalAirportDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalTerminal: freezed == arrivalTerminal
          ? _value.arrivalTerminal
          : arrivalTerminal // ignore: cast_nullable_to_non_nullable
              as String?,
      airlineCode: freezed == airlineCode
          ? _value.airlineCode
          : airlineCode // ignore: cast_nullable_to_non_nullable
              as String?,
      airlineName: freezed == airlineName
          ? _value.airlineName
          : airlineName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AirlineTicketHistoryDetails implements _AirlineTicketHistoryDetails {
  const _$_AirlineTicketHistoryDetails(
      {this.departureDate,
      this.departureAirportDetails,
      this.departureTerminal,
      this.arrivalDate,
      this.arrivalAirportDetails,
      this.arrivalTerminal,
      this.airlineCode,
      this.airlineName});

  factory _$_AirlineTicketHistoryDetails.fromJson(Map<String, dynamic> json) =>
      _$$_AirlineTicketHistoryDetailsFromJson(json);

  @override
  final String? departureDate;
  @override
  final String? departureAirportDetails;
  @override
  final String? departureTerminal;
  @override
  final String? arrivalDate;
  @override
  final String? arrivalAirportDetails;
  @override
  final String? arrivalTerminal;
  @override
  final String? airlineCode;
  @override
  final String? airlineName;

  @override
  String toString() {
    return 'AirlineTicketHistoryDetails(departureDate: $departureDate, departureAirportDetails: $departureAirportDetails, departureTerminal: $departureTerminal, arrivalDate: $arrivalDate, arrivalAirportDetails: $arrivalAirportDetails, arrivalTerminal: $arrivalTerminal, airlineCode: $airlineCode, airlineName: $airlineName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AirlineTicketHistoryDetails &&
            (identical(other.departureDate, departureDate) ||
                other.departureDate == departureDate) &&
            (identical(
                    other.departureAirportDetails, departureAirportDetails) ||
                other.departureAirportDetails == departureAirportDetails) &&
            (identical(other.departureTerminal, departureTerminal) ||
                other.departureTerminal == departureTerminal) &&
            (identical(other.arrivalDate, arrivalDate) ||
                other.arrivalDate == arrivalDate) &&
            (identical(other.arrivalAirportDetails, arrivalAirportDetails) ||
                other.arrivalAirportDetails == arrivalAirportDetails) &&
            (identical(other.arrivalTerminal, arrivalTerminal) ||
                other.arrivalTerminal == arrivalTerminal) &&
            (identical(other.airlineCode, airlineCode) ||
                other.airlineCode == airlineCode) &&
            (identical(other.airlineName, airlineName) ||
                other.airlineName == airlineName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      departureDate,
      departureAirportDetails,
      departureTerminal,
      arrivalDate,
      arrivalAirportDetails,
      arrivalTerminal,
      airlineCode,
      airlineName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AirlineTicketHistoryDetailsCopyWith<_$_AirlineTicketHistoryDetails>
      get copyWith => __$$_AirlineTicketHistoryDetailsCopyWithImpl<
          _$_AirlineTicketHistoryDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AirlineTicketHistoryDetailsToJson(
      this,
    );
  }
}

abstract class _AirlineTicketHistoryDetails
    implements AirlineTicketHistoryDetails {
  const factory _AirlineTicketHistoryDetails(
      {final String? departureDate,
      final String? departureAirportDetails,
      final String? departureTerminal,
      final String? arrivalDate,
      final String? arrivalAirportDetails,
      final String? arrivalTerminal,
      final String? airlineCode,
      final String? airlineName}) = _$_AirlineTicketHistoryDetails;

  factory _AirlineTicketHistoryDetails.fromJson(Map<String, dynamic> json) =
      _$_AirlineTicketHistoryDetails.fromJson;

  @override
  String? get departureDate;
  @override
  String? get departureAirportDetails;
  @override
  String? get departureTerminal;
  @override
  String? get arrivalDate;
  @override
  String? get arrivalAirportDetails;
  @override
  String? get arrivalTerminal;
  @override
  String? get airlineCode;
  @override
  String? get airlineName;
  @override
  @JsonKey(ignore: true)
  _$$_AirlineTicketHistoryDetailsCopyWith<_$_AirlineTicketHistoryDetails>
      get copyWith => throw _privateConstructorUsedError;
}
