import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/model/general_resp.dart';
import 'package:travel_mytri_mobile_v1/data/model/hive_class_functions.dart';
import '../Constants/urls.dart';
import 'model/Search/flight_search_model.dart';
import 'model/airport_list.dart';
import 'package:device_info/device_info.dart';

String baseUrl = "https://uattm.jameer.xyz";

class AuthenticationApi {
  AuthenticationUrl urls = AuthenticationUrl();
  Future<GeneralReponseModel?> authenticate({required String mobileNo, required String appSignature}) async {
    try {
      final url = Uri.parse(baseUrl + urls.authenticate);
      var deviceInfo = DeviceInfoPlugin();
      String deviceId = '';
      Map<String, String> header = {};

      if (Platform.isAndroid) {
        var androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
      final gToken = await getToken();

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }

      header = {
        "Authorization": "Bearer $gToken",
        "DeviceCode": "M",
        "content-type": "application/json",
        "os": Platform.isAndroid
            ? "Android"
            : Platform.isIOS
                ? "iOS"
                : "",
        "deviceId": deviceId,
        "appVersion": "1.0.0"
      };
      print(header);
      print(url);
      final result = await http.post(
        url,
        body: jsonEncode({"mobileNumber": mobileNo, "appSignatureID": appSignature}),
        headers: header,
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
      var deviceInfo = DeviceInfoPlugin();
      String deviceId = '';
      Map<String, String> header = {};

      if (Platform.isAndroid) {
        var androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
      final gToken = await getToken();

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }

      header = {
        "Authorization": "Bearer $gToken",
        "DeviceCode": "M",
        "content-type": "application/json",
        "os": Platform.isAndroid
            ? "Android"
            : Platform.isIOS
                ? "iOS"
                : "",
        "deviceId": deviceId,
        "appVersion": "1.0.0"
      };
      print(header);
      print(url);

      final result = await http.post(
        url,
        body: jsonEncode({"mobileNumber": mobileNo, "otp": otp}),
        headers: header,
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

  Future<ResponseWithToken?> noUserLogin() async {
    try {
      final url = Uri.parse(baseUrl + urls.startingApi);

      var deviceInfo = DeviceInfoPlugin();
      String deviceId = '';
      Map<String, String> header = {};

      if (Platform.isAndroid) {
        var androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
      final gToken = await getToken();

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }

      header = {
        "Authorization": "Bearer $gToken",
        "DeviceCode": "M",
        "content-type": "application/json",
        "os": Platform.isAndroid
            ? "Android"
            : Platform.isIOS
                ? "iOS"
                : "",
        "deviceId": deviceId,
        "appVersion": "1.0.0"
      };
      print(header);
      print(url);
      final result = await http.post(
        url,
        body: jsonEncode({}),
        headers: header,
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
      var deviceInfo = DeviceInfoPlugin();
      String deviceId = '';
      Map<String, String> header = {};

      if (Platform.isAndroid) {
        var androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
      final gToken = await getToken();

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }

      header = {
        "Authorization": "Bearer $gToken",
        "DeviceCode": "M",
        "content-type": "application/json",
        "os": Platform.isAndroid
            ? "Android"
            : Platform.isIOS
                ? "iOS"
                : "",
        "deviceId": deviceId,
        "appVersion": "1.0.0"
      };
      print(header);
      print(url);

      final result = await http.post(url, body: jsonEncode({}), headers: header);
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
      var deviceInfo = DeviceInfoPlugin();
      String deviceId = '';
      Map<String, String> header = {};

      if (Platform.isAndroid) {
        var androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
      final gToken = await getToken();

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }

      header = {
        "Authorization": "Bearer $gToken",
        "DeviceCode": "M",
        "content-type": "application/json",
        "os": Platform.isAndroid
            ? "Android"
            : Platform.isIOS
                ? "iOS"
                : "",
        "deviceId": deviceId,
        "appVersion": "1.0.0"
      };
      print(header);
      print(url);
      log(jsonEncode(data).toString() + "++++");
      final result = await http.post(url,
          body: jsonEncode(data),
          //  body: data.toJson(),
          headers: header);
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

  Future<RAirlineSearchResponse?> combinedRoundTrip(FlightSearchReqModel data) async {
    try {
      final url = Uri.parse(baseUrl + urls.combinedRoundTrip);
      var deviceInfo = DeviceInfoPlugin();
      String deviceId = '';
      Map<String, String> header = {};

      if (Platform.isAndroid) {
        var androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
      final gToken = await getToken();

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }

      header = {
        "Authorization": "Bearer $gToken",
        "DeviceCode": "M",
        "content-type": "application/json",
        "os": Platform.isAndroid
            ? "Android"
            : Platform.isIOS
                ? "iOS"
                : "",
        "deviceId": deviceId,
        "appVersion": "1.0.0"
      };
      print(header);
      print(url);
      log(jsonEncode(data).toString() + "++++");
      final result = await http.post(url,
          body: jsonEncode(data),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = RAirlineSearchResponse.fromJson(resultAsJson);
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

  Future<IRAirlineSearchResponse?> individualRoundTrip(FlightSearchReqModel data) async {
    try {
      final url = Uri.parse(baseUrl + urls.individualRoundTrip);
      var deviceInfo = DeviceInfoPlugin();
      String deviceId = '';
      Map<String, String> header = {};

      if (Platform.isAndroid) {
        var androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
      }
      final gToken = await getToken();

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }

      header = {
        "Authorization": "Bearer $gToken",
        "DeviceCode": "M",
        "content-type": "application/json",
        "os": Platform.isAndroid
            ? "Android"
            : Platform.isIOS
                ? "iOS"
                : "",
        "deviceId": deviceId,
        "appVersion": "1.0.0"
      };
      print(header);
      print(url);
      log(jsonEncode(data).toString() + "++++");
      final result = await http.post(url,
          body: jsonEncode(data),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = IRAirlineSearchResponse.fromJson(resultAsJson);
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
