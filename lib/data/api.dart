import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/model/general_resp.dart';
import '../Constants/urls.dart';
import 'model/My Trip/flights.dart';

String gToken = "25p5c8kP0yiRZf4uUw6F+mhLXlrqKknx0A3xX2ZrERgDZCkdF3W+u1NH25EhdTTr";
String baseUrl = "uattm.jameer.xyz";
AuthenticationUrl authUrl = AuthenticationUrl();

class AuthenticationApi {
  Future<GeneralReponseModel?> authenticate({required String mobileNo}) async {
    try {
      final result = await http.post(
        Uri.http(
          baseUrl,
          authUrl.authenticate,
        ),
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

  Future<ResponseWithToken?> otpSubmit({required String mobileNo, required int otp}) async {
    try {
      final result = await http.post(
        Uri.http(
          baseUrl,
          authUrl.otpSubmit,
        ),
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
