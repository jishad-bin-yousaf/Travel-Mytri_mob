import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/general_resp.freezed.dart';
part '../gen/general_resp.g.dart';

@freezed
class GeneralReponseModel with _$GeneralReponseModel {
  factory GeneralReponseModel({
    bool? status,
    String? responseMessage,
  }) = _GeneralResponceModel;

  factory GeneralReponseModel.fromJson(Map<String, dynamic> json) => _$GeneralReponseModelFromJson(json);
}

@freezed
class ResponseWithToken with _$ResponseWithToken {
  factory ResponseWithToken({
    bool? status,
    String? responseMessage,
    String? token,
    UserDetails? objUser,
  }) = _ResponseWithToken;

  factory ResponseWithToken.fromJson(Map<String, dynamic> json) => _$ResponseWithTokenFromJson(json);
}

@freezed
class UserDetails with _$UserDetails {
  factory UserDetails({
    String? fullName,
    String? firstName,
    String? lastName,
    String? userId,
  }) = _UserDetails;

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);
}
