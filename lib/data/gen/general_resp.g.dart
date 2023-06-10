// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/general_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeneralResponceModel _$$_GeneralResponceModelFromJson(
        Map<String, dynamic> json) =>
    _$_GeneralResponceModel(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
    );

Map<String, dynamic> _$$_GeneralResponceModelToJson(
        _$_GeneralResponceModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
    };

_$_ResponseWithToken _$$_ResponseWithTokenFromJson(Map<String, dynamic> json) =>
    _$_ResponseWithToken(
      status: json['status'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      token: json['token'] as String?,
      objUser: json['objUser'] == null
          ? null
          : UserDetails.fromJson(json['objUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ResponseWithTokenToJson(
        _$_ResponseWithToken instance) =>
    <String, dynamic>{
      'status': instance.status,
      'responseMessage': instance.responseMessage,
      'token': instance.token,
      'objUser': instance.objUser,
    };

_$_UserDetails _$$_UserDetailsFromJson(Map<String, dynamic> json) =>
    _$_UserDetails(
      fullName: json['fullName'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$_UserDetailsToJson(_$_UserDetails instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userId': instance.userId,
    };
