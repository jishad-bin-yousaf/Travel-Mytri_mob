// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../model/general_resp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeneralReponseModel _$GeneralReponseModelFromJson(Map<String, dynamic> json) {
  return _GeneralResponceModel.fromJson(json);
}

/// @nodoc
mixin _$GeneralReponseModel {
  bool? get status => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeneralReponseModelCopyWith<GeneralReponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralReponseModelCopyWith<$Res> {
  factory $GeneralReponseModelCopyWith(
          GeneralReponseModel value, $Res Function(GeneralReponseModel) then) =
      _$GeneralReponseModelCopyWithImpl<$Res, GeneralReponseModel>;
  @useResult
  $Res call({bool? status, String? responseMessage});
}

/// @nodoc
class _$GeneralReponseModelCopyWithImpl<$Res, $Val extends GeneralReponseModel>
    implements $GeneralReponseModelCopyWith<$Res> {
  _$GeneralReponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GeneralResponceModelCopyWith<$Res>
    implements $GeneralReponseModelCopyWith<$Res> {
  factory _$$_GeneralResponceModelCopyWith(_$_GeneralResponceModel value,
          $Res Function(_$_GeneralResponceModel) then) =
      __$$_GeneralResponceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? responseMessage});
}

/// @nodoc
class __$$_GeneralResponceModelCopyWithImpl<$Res>
    extends _$GeneralReponseModelCopyWithImpl<$Res, _$_GeneralResponceModel>
    implements _$$_GeneralResponceModelCopyWith<$Res> {
  __$$_GeneralResponceModelCopyWithImpl(_$_GeneralResponceModel _value,
      $Res Function(_$_GeneralResponceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
  }) {
    return _then(_$_GeneralResponceModel(
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
class _$_GeneralResponceModel implements _GeneralResponceModel {
  _$_GeneralResponceModel({this.status, this.responseMessage});

  factory _$_GeneralResponceModel.fromJson(Map<String, dynamic> json) =>
      _$$_GeneralResponceModelFromJson(json);

  @override
  final bool? status;
  @override
  final String? responseMessage;

  @override
  String toString() {
    return 'GeneralReponseModel(status: $status, responseMessage: $responseMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeneralResponceModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, responseMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeneralResponceModelCopyWith<_$_GeneralResponceModel> get copyWith =>
      __$$_GeneralResponceModelCopyWithImpl<_$_GeneralResponceModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeneralResponceModelToJson(
      this,
    );
  }
}

abstract class _GeneralResponceModel implements GeneralReponseModel {
  factory _GeneralResponceModel(
      {final bool? status,
      final String? responseMessage}) = _$_GeneralResponceModel;

  factory _GeneralResponceModel.fromJson(Map<String, dynamic> json) =
      _$_GeneralResponceModel.fromJson;

  @override
  bool? get status;
  @override
  String? get responseMessage;
  @override
  @JsonKey(ignore: true)
  _$$_GeneralResponceModelCopyWith<_$_GeneralResponceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ResponseWithToken _$ResponseWithTokenFromJson(Map<String, dynamic> json) {
  return _ResponseWithToken.fromJson(json);
}

/// @nodoc
mixin _$ResponseWithToken {
  bool? get status => throw _privateConstructorUsedError;
  String? get responseMessage => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  UserDetails? get objUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseWithTokenCopyWith<ResponseWithToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseWithTokenCopyWith<$Res> {
  factory $ResponseWithTokenCopyWith(
          ResponseWithToken value, $Res Function(ResponseWithToken) then) =
      _$ResponseWithTokenCopyWithImpl<$Res, ResponseWithToken>;
  @useResult
  $Res call(
      {bool? status,
      String? responseMessage,
      String? token,
      UserDetails? objUser});

  $UserDetailsCopyWith<$Res>? get objUser;
}

/// @nodoc
class _$ResponseWithTokenCopyWithImpl<$Res, $Val extends ResponseWithToken>
    implements $ResponseWithTokenCopyWith<$Res> {
  _$ResponseWithTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
    Object? token = freezed,
    Object? objUser = freezed,
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
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      objUser: freezed == objUser
          ? _value.objUser
          : objUser // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsCopyWith<$Res>? get objUser {
    if (_value.objUser == null) {
      return null;
    }

    return $UserDetailsCopyWith<$Res>(_value.objUser!, (value) {
      return _then(_value.copyWith(objUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResponseWithTokenCopyWith<$Res>
    implements $ResponseWithTokenCopyWith<$Res> {
  factory _$$_ResponseWithTokenCopyWith(_$_ResponseWithToken value,
          $Res Function(_$_ResponseWithToken) then) =
      __$$_ResponseWithTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status,
      String? responseMessage,
      String? token,
      UserDetails? objUser});

  @override
  $UserDetailsCopyWith<$Res>? get objUser;
}

/// @nodoc
class __$$_ResponseWithTokenCopyWithImpl<$Res>
    extends _$ResponseWithTokenCopyWithImpl<$Res, _$_ResponseWithToken>
    implements _$$_ResponseWithTokenCopyWith<$Res> {
  __$$_ResponseWithTokenCopyWithImpl(
      _$_ResponseWithToken _value, $Res Function(_$_ResponseWithToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? responseMessage = freezed,
    Object? token = freezed,
    Object? objUser = freezed,
  }) {
    return _then(_$_ResponseWithToken(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      responseMessage: freezed == responseMessage
          ? _value.responseMessage
          : responseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      objUser: freezed == objUser
          ? _value.objUser
          : objUser // ignore: cast_nullable_to_non_nullable
              as UserDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseWithToken implements _ResponseWithToken {
  _$_ResponseWithToken(
      {this.status, this.responseMessage, this.token, this.objUser});

  factory _$_ResponseWithToken.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseWithTokenFromJson(json);

  @override
  final bool? status;
  @override
  final String? responseMessage;
  @override
  final String? token;
  @override
  final UserDetails? objUser;

  @override
  String toString() {
    return 'ResponseWithToken(status: $status, responseMessage: $responseMessage, token: $token, objUser: $objUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseWithToken &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.responseMessage, responseMessage) ||
                other.responseMessage == responseMessage) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.objUser, objUser) || other.objUser == objUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, responseMessage, token, objUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseWithTokenCopyWith<_$_ResponseWithToken> get copyWith =>
      __$$_ResponseWithTokenCopyWithImpl<_$_ResponseWithToken>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseWithTokenToJson(
      this,
    );
  }
}

abstract class _ResponseWithToken implements ResponseWithToken {
  factory _ResponseWithToken(
      {final bool? status,
      final String? responseMessage,
      final String? token,
      final UserDetails? objUser}) = _$_ResponseWithToken;

  factory _ResponseWithToken.fromJson(Map<String, dynamic> json) =
      _$_ResponseWithToken.fromJson;

  @override
  bool? get status;
  @override
  String? get responseMessage;
  @override
  String? get token;
  @override
  UserDetails? get objUser;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseWithTokenCopyWith<_$_ResponseWithToken> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) {
  return _UserDetails.fromJson(json);
}

/// @nodoc
mixin _$UserDetails {
  String? get fullName => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDetailsCopyWith<UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsCopyWith<$Res> {
  factory $UserDetailsCopyWith(
          UserDetails value, $Res Function(UserDetails) then) =
      _$UserDetailsCopyWithImpl<$Res, UserDetails>;
  @useResult
  $Res call(
      {String? fullName, String? firstName, String? lastName, String? userId});
}

/// @nodoc
class _$UserDetailsCopyWithImpl<$Res, $Val extends UserDetails>
    implements $UserDetailsCopyWith<$Res> {
  _$UserDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDetailsCopyWith<$Res>
    implements $UserDetailsCopyWith<$Res> {
  factory _$$_UserDetailsCopyWith(
          _$_UserDetails value, $Res Function(_$_UserDetails) then) =
      __$$_UserDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? fullName, String? firstName, String? lastName, String? userId});
}

/// @nodoc
class __$$_UserDetailsCopyWithImpl<$Res>
    extends _$UserDetailsCopyWithImpl<$Res, _$_UserDetails>
    implements _$$_UserDetailsCopyWith<$Res> {
  __$$_UserDetailsCopyWithImpl(
      _$_UserDetails _value, $Res Function(_$_UserDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_UserDetails(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDetails implements _UserDetails {
  _$_UserDetails({this.fullName, this.firstName, this.lastName, this.userId});

  factory _$_UserDetails.fromJson(Map<String, dynamic> json) =>
      _$$_UserDetailsFromJson(json);

  @override
  final String? fullName;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? userId;

  @override
  String toString() {
    return 'UserDetails(fullName: $fullName, firstName: $firstName, lastName: $lastName, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetails &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fullName, firstName, lastName, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailsCopyWith<_$_UserDetails> get copyWith =>
      __$$_UserDetailsCopyWithImpl<_$_UserDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDetailsToJson(
      this,
    );
  }
}

abstract class _UserDetails implements UserDetails {
  factory _UserDetails(
      {final String? fullName,
      final String? firstName,
      final String? lastName,
      final String? userId}) = _$_UserDetails;

  factory _UserDetails.fromJson(Map<String, dynamic> json) =
      _$_UserDetails.fromJson;

  @override
  String? get fullName;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailsCopyWith<_$_UserDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
