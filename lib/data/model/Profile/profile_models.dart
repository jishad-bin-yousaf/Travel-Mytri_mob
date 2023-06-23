import 'package:freezed_annotation/freezed_annotation.dart';
part '../../gen/Profile/profile_models.freezed.dart';
part '../../gen/Profile/profile_models.g.dart';

@freezed
class GetProfileResponse with _$GetProfileResponse {
  const factory GetProfileResponse({
    bool? status,
    String? responseMessage,
    String? email,
    String? firstName,
    String? lastName,
    String? address,
    String? pincode,
    String? city,
    String? countryId,
    String? country,
    String? state,
    String? stateId,
    String? fullName,
    int? passwordStatus,
    int? userId,
  }) = _GetProfileResponse;

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) => _$GetProfileResponseFromJson(json);
}

@freezed
class EditProfileRequest with _$EditProfileRequest {
  const factory EditProfileRequest({
    int? userId,
    String? fullName,
    String? email,
    String? mobile,
    String? firstName,
    String? lastName,
    String? password,
    String? address,
    String? pincode,
    String? city,
    String? countryId,
    String? stateId,
  }) = _EditProfileRequest;

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) => _$EditProfileRequestFromJson(json);
}

@freezed
class EditProfileResponse with _$EditProfileResponse {
  const factory EditProfileResponse({
    bool? status,
    String? responseMessage,
    String? fullame,
    String? userId,
    String? firstName,
    String? lastName,
  }) = _EditProfileResponse;

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) => _$EditProfileResponseFromJson(json);
}
