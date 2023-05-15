import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/model/general_resp.dart';
import '../Constants/urls.dart';
import 'model/Search/flight_search_model.dart';
import 'model/airport_list.dart';

String gToken = "pJwR9rg5VOIqriYYZ3ikMJYdqg23yI94aoRRyTbqaUZQP15boKof1MQeDZrvcjN3";
String baseUrl = "https://uattm.jameer.xyz";

class AuthenticationApi {
  AuthenticationUrl urls = AuthenticationUrl();
  Future<GeneralReponseModel?> authenticate({required String mobileNo, required String appSignature}) async {
    try {
      final url = Uri.parse(baseUrl + urls.authenticate);
      print(url);
      final result = await http.post(
        url,
        body: jsonEncode({"mobileNumber": mobileNo, "appSignatureID": appSignature}),
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

  Future<ResponseWithToken?> otpSubmit({required String mobileNo, required otp}) async {
    try {
      final url = Uri.parse(baseUrl + urls.otpSubmit);
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
      log("${e.message}+++++");
    } catch (e) {
      log("Error :$e");
    }
    return null;
  }
}

class AirlineApi {
  AirlineUrl urls = AirlineUrl();
  Future<List<AirportData>?> getAirport() async {
    try {
      final url = Uri.parse(baseUrl + urls.airport);
      print(url);
      final result = await http.post(
        url,
        body: jsonEncode({}),
        headers: {"Authorization": "Bearer $gToken", "DeviceCode": "M", "content-type": "application/json"},
      );
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = AirportList.fromJson(resultAsJson);
      // Helper().toastMessage(responseModel.);
      return responseModel.objAirportList;
    } on http.ClientException catch (e) {
      log(e.message.toString() + "+++++");
    } catch (e) {
      log("Error :$e");
    }
    return null;
  }
}

class SearchApi {
  SearchUrl urls = SearchUrl();
  Future<AirlineSearchResponse?> oneWay(FlightSearchReqModel data) async {
    try {
      final url = Uri.parse(baseUrl + urls.search);
      log("Token:$gToken");
      print(url);
      log(jsonEncode(data).toString() + "++++");
      final result = await http.post(
        url,
        body: jsonEncode(data),
        //  body: data.toJson(),
        headers: {"Authorization": "Bearer $gToken", "DeviceCode": "M", "content-type": "application/json"},
      );
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = AirlineSearchResponse.fromJson(resultAsJson);
      // Helper().toastMessage(responseModel.);
      return responseModel;
    } on http.ClientException catch (e) {
      log(e.message.toString() + "+++++");
      throw Exception();
    } catch (e) {
      log("Error :$e");
    }
    return null;
  }

  Future<AirlineSearchResponse?> combinedRoundTrip(FlightSearchReqModel data) async {
    try {
      final url = Uri.parse(baseUrl + urls.combinedRoundTrip);
      log("Token:$gToken");
      print(url);
      log(jsonEncode(data).toString() + "++++");
      final result = await http.post(
        url,
        body: jsonEncode(data),
        //  body: data.toJson(),
        headers: {"Authorization": "Bearer $gToken", "DeviceCode": "M", "content-type": "application/json"},
      );
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = AirlineSearchResponse.fromJson(resultAsJson);
      // Helper().toastMessage(responseModel.);
      return responseModel;
    } on http.ClientException catch (e) {
      log(e.message.toString() + "+++++");
      throw Exception();
    } catch (e) {
      log("Error :$e");
    }
    return null;
  }

  Future<AirlineSearchResponse?> individualRoundTrip(FlightSearchReqModel data) async {
    try {
      final url = Uri.parse(baseUrl + urls.individualRoundTrip);
      log("Token:$gToken");
      print(url);
      log(jsonEncode(data).toString() + "++++");
      final result = await http.post(
        url,
        body: jsonEncode(data),
        //  body: data.toJson(),
        headers: {"Authorization": "Bearer $gToken", "DeviceCode": "M", "content-type": "application/json"},
      );
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = AirlineSearchResponse.fromJson(resultAsJson);
      // Helper().toastMessage(responseModel.);
      return responseModel;
    } on http.ClientException catch (e) {
      log(e.message.toString() + "+++++");
      throw Exception();
    } catch (e) {
      log("Error :$e");
    }
    return null;
  }
}
