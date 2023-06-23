// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/Profile/profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetProfileResponse _$$_GetProfileResponseFromJson(
        Map<String, dynamic> json) =>
    _$_GetProfileResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as String?,
      city: json['city'] as String?,
      countryId: json['countryId'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      stateId: json['stateId'] as String?,
      fullName: json['fullName'] as String?,
      passwordStatus: json['passwordStatus'] as int?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$$_GetProfileResponseToJson(
        _$_GetProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'pincode': instance.pincode,
      'city': instance.city,
      'countryId': instance.countryId,
      'country': instance.country,
      'state': instance.state,
      'stateId': instance.stateId,
      'fullName': instance.fullName,
      'passwordStatus': instance.passwordStatus,
      'userId': instance.userId,
    };

_$_EditProfileRequest _$$_EditProfileRequestFromJson(
        Map<String, dynamic> json) =>
    _$_EditProfileRequest(
      userId: json['userId'] as int?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      password: json['password'] as String?,
      address: json['address'] as String?,
      pincode: json['pincode'] as String?,
      city: json['city'] as String?,
      countryId: json['countryId'] as String?,
      stateId: json['stateId'] as String?,
    );

Map<String, dynamic> _$$_EditProfileRequestToJson(
        _$_EditProfileRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'mobile': instance.mobile,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'address': instance.address,
      'pincode': instance.pincode,
      'city': instance.city,
      'countryId': instance.countryId,
      'stateId': instance.stateId,
    };

_$_EditProfileResponse _$$_EditProfileResponseFromJson(
        Map<String, dynamic> json) =>
    _$_EditProfileResponse(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      fullame: json['fullame'] as String?,
      userId: json['userId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$_EditProfileResponseToJson(
        _$_EditProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'fullame': instance.fullame,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
