// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../model/Transactions/transactions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountStatementResponse _$AccountStatementResponseFromJson(
    Map<String, dynamic> json) {
  return _AccountStatementResponse.fromJson(json);
}

/// @nodoc
mixin _$AccountStatementResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;
  List<DaywiseStatement>? get objDaywiseStatement =>
      throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountStatementResponseCopyWith<AccountStatementResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStatementResponseCopyWith<$Res> {
  factory $AccountStatementResponseCopyWith(AccountStatementResponse value,
          $Res Function(AccountStatementResponse) then) =
      _$AccountStatementResponseCopyWithImpl<$Res, AccountStatementResponse>;
  @useResult
  $Res call(
      {bool? status,
      String? responseMessage,
      List<DaywiseStatement>? objDaywiseStatement,
      double? totalAmount});
}

/// @nodoc
class _$AccountStatementResponseCopyWithImpl<$Res,
        $Val extends AccountStatementResponse>
    implements $AccountStatementResponseCopyWith<$Res> {
  _$AccountStatementResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
    Object? objDaywiseStatement = freezed,
    Object? totalAmount = freezed,
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
      objDaywiseStatement: freezed == objDaywiseStatement
          ? _value.objDaywiseStatement
          : objDaywiseStatement // ignore: cast_nullable_to_non_nullable
              as List<DaywiseStatement>?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountStatementResponseCopyWith<$Res>
    implements $AccountStatementResponseCopyWith<$Res> {
  factory _$$_AccountStatementResponseCopyWith(
          _$_AccountStatementResponse value,
          $Res Function(_$_AccountStatementResponse) then) =
      __$$_AccountStatementResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status,
      String? responseMessage,
      List<DaywiseStatement>? objDaywiseStatement,
      double? totalAmount});
}

/// @nodoc
class __$$_AccountStatementResponseCopyWithImpl<$Res>
    extends _$AccountStatementResponseCopyWithImpl<$Res,
        _$_AccountStatementResponse>
    implements _$$_AccountStatementResponseCopyWith<$Res> {
  __$$_AccountStatementResponseCopyWithImpl(_$_AccountStatementResponse _value,
      $Res Function(_$_AccountStatementResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
    Object? objDaywiseStatement = freezed,
    Object? totalAmount = freezed,
  }) {
    return _then(_$_AccountStatementResponse(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      objDaywiseStatement: freezed == objDaywiseStatement
          ? _value._objDaywiseStatement
          : objDaywiseStatement // ignore: cast_nullable_to_non_nullable
              as List<DaywiseStatement>?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountStatementResponse implements _AccountStatementResponse {
  const _$_AccountStatementResponse(
      {this.status,
      this.responseMessage,
      final List<DaywiseStatement>? objDaywiseStatement,
      this.totalAmount})
      : _objDaywiseStatement = objDaywiseStatement;

  factory _$_AccountStatementResponse.fromJson(Map<String, dynamic> json) =>
      _$$_AccountStatementResponseFromJson(json);

  @override
  final bool? status;
  @override
  final String? responseMessage;
  final List<DaywiseStatement>? _objDaywiseStatement;
  @override
  List<DaywiseStatement>? get objDaywiseStatement {
    final value = _objDaywiseStatement;
    if (value == null) return null;
    if (_objDaywiseStatement is EqualUnmodifiableListView)
      return _objDaywiseStatement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double? totalAmount;

  @override
  String toString() {
    return 'AccountStatementResponse(status: $status, responseMessage: $responseMessage, objDaywiseStatement: $objDaywiseStatement, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountStatementResponse &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage) &&
            const DeepCollectionEquality()
                .equals(other._objDaywiseStatement, _objDaywiseStatement) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, responseMessage,
      const DeepCollectionEquality().hash(_objDaywiseStatement), totalAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountStatementResponseCopyWith<_$_AccountStatementResponse>
      get copyWith => __$$_AccountStatementResponseCopyWithImpl<
          _$_AccountStatementResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountStatementResponseToJson(
      this,
    );
  }
}

abstract class _AccountStatementResponse implements AccountStatementResponse {
  const factory _AccountStatementResponse(
      {final bool? status,
      final String? responseMessage,
      final List<DaywiseStatement>? objDaywiseStatement,
      final double? totalAmount}) = _$_AccountStatementResponse;

  factory _AccountStatementResponse.fromJson(Map<String, dynamic> json) =
      _$_AccountStatementResponse.fromJson;

  @override
  bool? get status;
  @override
  String? get responseMessage;
  @override
  List<DaywiseStatement>? get objDaywiseStatement;
  @override
  double? get totalAmount;
  @override
  @JsonKey(ignore: true)
  _$$_AccountStatementResponseCopyWith<_$_AccountStatementResponse>
      get copyWith => throw _privateConstructorUsedError;
}

DaywiseStatement _$DaywiseStatementFromJson(Map<String, dynamic> json) {
  return _DaywiseStatement.fromJson(json);
}

/// @nodoc
mixin _$DaywiseStatement {
  String? get date => throw _privateConstructorUsedError;
  List<AccountStatement>? get objAccountStatement =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DaywiseStatementCopyWith<DaywiseStatement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaywiseStatementCopyWith<$Res> {
  factory $DaywiseStatementCopyWith(
          DaywiseStatement value, $Res Function(DaywiseStatement) then) =
      _$DaywiseStatementCopyWithImpl<$Res, DaywiseStatement>;
  @useResult
  $Res call({String? date, List<AccountStatement>? objAccountStatement});
}

/// @nodoc
class _$DaywiseStatementCopyWithImpl<$Res, $Val extends DaywiseStatement>
    implements $DaywiseStatementCopyWith<$Res> {
  _$DaywiseStatementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? objAccountStatement = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      objAccountStatement: freezed == objAccountStatement
          ? _value.objAccountStatement
          : objAccountStatement // ignore: cast_nullable_to_non_nullable
              as List<AccountStatement>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DaywiseStatementCopyWith<$Res>
    implements $DaywiseStatementCopyWith<$Res> {
  factory _$$_DaywiseStatementCopyWith(
          _$_DaywiseStatement value, $Res Function(_$_DaywiseStatement) then) =
      __$$_DaywiseStatementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? date, List<AccountStatement>? objAccountStatement});
}

/// @nodoc
class __$$_DaywiseStatementCopyWithImpl<$Res>
    extends _$DaywiseStatementCopyWithImpl<$Res, _$_DaywiseStatement>
    implements _$$_DaywiseStatementCopyWith<$Res> {
  __$$_DaywiseStatementCopyWithImpl(
      _$_DaywiseStatement _value, $Res Function(_$_DaywiseStatement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? objAccountStatement = freezed,
  }) {
    return _then(_$_DaywiseStatement(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      objAccountStatement: freezed == objAccountStatement
          ? _value._objAccountStatement
          : objAccountStatement // ignore: cast_nullable_to_non_nullable
              as List<AccountStatement>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DaywiseStatement implements _DaywiseStatement {
  const _$_DaywiseStatement(
      {this.date, final List<AccountStatement>? objAccountStatement})
      : _objAccountStatement = objAccountStatement;

  factory _$_DaywiseStatement.fromJson(Map<String, dynamic> json) =>
      _$$_DaywiseStatementFromJson(json);

  @override
  final String? date;
  final List<AccountStatement>? _objAccountStatement;
  @override
  List<AccountStatement>? get objAccountStatement {
    final value = _objAccountStatement;
    if (value == null) return null;
    if (_objAccountStatement is EqualUnmodifiableListView)
      return _objAccountStatement;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'DaywiseStatement(date: $date, objAccountStatement: $objAccountStatement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DaywiseStatement &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._objAccountStatement, _objAccountStatement));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date,
      const DeepCollectionEquality().hash(_objAccountStatement));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DaywiseStatementCopyWith<_$_DaywiseStatement> get copyWith =>
      __$$_DaywiseStatementCopyWithImpl<_$_DaywiseStatement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DaywiseStatementToJson(
      this,
    );
  }
}

abstract class _DaywiseStatement implements DaywiseStatement {
  const factory _DaywiseStatement(
      {final String? date,
      final List<AccountStatement>? objAccountStatement}) = _$_DaywiseStatement;

  factory _DaywiseStatement.fromJson(Map<String, dynamic> json) =
      _$_DaywiseStatement.fromJson;

  @override
  String? get date;
  @override
  List<AccountStatement>? get objAccountStatement;
  @override
  @JsonKey(ignore: true)
  _$$_DaywiseStatementCopyWith<_$_DaywiseStatement> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountStatement _$AccountStatementFromJson(Map<String, dynamic> json) {
  return _AccountStatement.fromJson(json);
}

/// @nodoc
mixin _$AccountStatement {
  String? get transactionType => throw _privateConstructorUsedError;
  String? get transactionDetails => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountStatementCopyWith<AccountStatement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStatementCopyWith<$Res> {
  factory $AccountStatementCopyWith(
          AccountStatement value, $Res Function(AccountStatement) then) =
      _$AccountStatementCopyWithImpl<$Res, AccountStatement>;
  @useResult
  $Res call(
      {String? transactionType,
      String? transactionDetails,
      String? time,
      String? source,
      double? amount,
      String? comments});
}

/// @nodoc
class _$AccountStatementCopyWithImpl<$Res, $Val extends AccountStatement>
    implements $AccountStatementCopyWith<$Res> {
  _$AccountStatementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = freezed,
    Object? transactionDetails = freezed,
    Object? time = freezed,
    Object? source = freezed,
    Object? amount = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDetails: freezed == transactionDetails
          ? _value.transactionDetails
          : transactionDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountStatementCopyWith<$Res>
    implements $AccountStatementCopyWith<$Res> {
  factory _$$_AccountStatementCopyWith(
          _$_AccountStatement value, $Res Function(_$_AccountStatement) then) =
      __$$_AccountStatementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? transactionType,
      String? transactionDetails,
      String? time,
      String? source,
      double? amount,
      String? comments});
}

/// @nodoc
class __$$_AccountStatementCopyWithImpl<$Res>
    extends _$AccountStatementCopyWithImpl<$Res, _$_AccountStatement>
    implements _$$_AccountStatementCopyWith<$Res> {
  __$$_AccountStatementCopyWithImpl(
      _$_AccountStatement _value, $Res Function(_$_AccountStatement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = freezed,
    Object? transactionDetails = freezed,
    Object? time = freezed,
    Object? source = freezed,
    Object? amount = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$_AccountStatement(
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDetails: freezed == transactionDetails
          ? _value.transactionDetails
          : transactionDetails // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountStatement implements _AccountStatement {
  const _$_AccountStatement(
      {this.transactionType,
      this.transactionDetails,
      this.time,
      this.source,
      this.amount,
      this.comments});

  factory _$_AccountStatement.fromJson(Map<String, dynamic> json) =>
      _$$_AccountStatementFromJson(json);

  @override
  final String? transactionType;
  @override
  final String? transactionDetails;
  @override
  final String? time;
  @override
  final String? source;
  @override
  final double? amount;
  @override
  final String? comments;

  @override
  String toString() {
    return 'AccountStatement(transactionType: $transactionType, transactionDetails: $transactionDetails, time: $time, source: $source, amount: $amount, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountStatement &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.transactionDetails, transactionDetails) ||
                other.transactionDetails == transactionDetails) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.comments, comments) ||
                other.comments == comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, transactionType,
      transactionDetails, time, source, amount, comments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountStatementCopyWith<_$_AccountStatement> get copyWith =>
      __$$_AccountStatementCopyWithImpl<_$_AccountStatement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountStatementToJson(
      this,
    );
  }
}

abstract class _AccountStatement implements AccountStatement {
  const factory _AccountStatement(
      {final String? transactionType,
      final String? transactionDetails,
      final String? time,
      final String? source,
      final double? amount,
      final String? comments}) = _$_AccountStatement;

  factory _AccountStatement.fromJson(Map<String, dynamic> json) =
      _$_AccountStatement.fromJson;

  @override
  String? get transactionType;
  @override
  String? get transactionDetails;
  @override
  String? get time;
  @override
  String? get source;
  @override
  double? get amount;
  @override
  String? get comments;
  @override
  @JsonKey(ignore: true)
  _$$_AccountStatementCopyWith<_$_AccountStatement> get copyWith =>
      throw _privateConstructorUsedError;
}
