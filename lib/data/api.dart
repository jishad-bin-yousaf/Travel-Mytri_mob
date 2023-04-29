import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/model/general_resp.dart';
import '../Constants/urls.dart';

String gToken = "";
String baseUrl = "https://uattm.jameer.xyz";
AuthenticationUrl authUrl = AuthenticationUrl();

class AuthenticationApi {
  Future<GeneralReponseModel?> authenticate({required String mobileNo}) async {
    try {
      final url = Uri.parse(baseUrl + authUrl.authenticate);
      print(url);
      final result = await http.post(
        url,
        body: jsonEncode({"mobileNumber": mobileNo}),
        headers: {"Authorization": "Bearer $gToken", "DeviceCode": "M", "content-type": "application/json"},
      );
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      log(resultAsJson.toString());
      final responseModel = GeneralReponseModel.fromJson(resultAsJson);
      print(responseModel);
      Helper().toastMessage(responseModel.responseMessage);
      return responseModel;
    } on http.ClientException catch (e) {
      log(e.message.toString() + "+++++");
    } catch (e) {
      log("Error :$e");
    }
    return null;
  }

/* Error :HandshakeException: Handshake error in client (OS Error: 
      	CERTIFICATE_VERIFY_FAILED: Hostname mismatch(handshake.cc:393)) */
  Future<ResponseWithToken?> otpSubmit({required String mobileNo, required int otp}) async {
    try {
      final url = Uri.parse(baseUrl + authUrl.otpSubmit);
      print({"mobileNumber": mobileNo, "otp": otp});
      print(url);
      final result = await http.post(
        url,
        body: jsonEncode({"mobileNumber": mobileNo, "otp": otp}),
        headers: {"Authorization": "Bearer $gToken", "DeviceCode": "M", "content-type": "application/json"},
      );
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      log(resultAsJson.toString());
      final responseModel = ResponseWithToken.fromJson(resultAsJson);
      Helper().toastMessage(responseModel.responseMessage);
      return responseModel;
    } on http.ClientException catch (e) {
      log(e.message.toString() + "+++++");
    } catch (e) {
      log("Error :$e");
    }
    return null;
  }
}
