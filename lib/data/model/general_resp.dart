import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/general_resp.freezed.dart';
part '../gen/general_resp.g.dart';

@freezed
class GeneralReponseModel with _$GeneralReponseModel {
  factory GeneralReponseModel({
    bool? status,
    String? responseMessage,
  }) = _GeneralResponceModel;

  factory GeneralReponseModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralReponseModelFromJson(json);
}

@freezed
class ResponseWithToken with _$ResponseWithToken {
  factory ResponseWithToken({
    bool? status,
    String? responseMessage,
    String? token,
  }) = _ResponseWithToken;

  factory ResponseWithToken.fromJson(Map<String, dynamic> json) =>
      _$ResponseWithTokenFromJson(json);
}
