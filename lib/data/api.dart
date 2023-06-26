import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/model/Transactions/transactions_model.dart';
import 'package:travel_mytri_mobile_v1/data/model/general_resp.dart';
import 'package:travel_mytri_mobile_v1/data/model/hive_class_functions.dart';
import '../Constants/urls.dart';
import 'model/My Trip/my_trips.dart';
import 'model/Profile/profile_models.dart';
import 'model/Search/flight_search_model.dart';
import 'model/Search/pricing_models.dart';
import 'model/utilities.dart';
import 'package:device_info/device_info.dart';

String baseUrl = "https://uattm.jameer.xyz";

Future<Map<String, String>> getHeader() async {
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
  await getToken().then((value) {
    if (value.token != '') {
      header = {
        "Authorization": "Bearer ${value.token} ",
        "DeviceCode": "M",
        "content-type": "application/json",
        "os": Platform.isAndroid
            ? "Android"
            : Platform.isIOS
                ? "iOS"
                : "W",
        "deviceId": deviceId,
        "appVersion": "1.0.0"
      };
    } else {
      header = {
        "Authorization": "Bearer No token",
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
    }
  });

  return header;
}

class AuthenticationApi {
  AuthenticationUrl urls = AuthenticationUrl();
  Future<GeneralReponseModel?> authenticate({required String mobileNo, required String appSignature}) async {
    try {
      final url = Uri.parse(baseUrl + urls.authenticate);

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }
      final header = await getHeader();
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

      if (Platform.isAndroid) {
        log("Android");
      } else if (Platform.isIOS) {
        log("iOS");
      }
      final header = await getHeader();

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
      await getToken().then((value) => header = {
            "Authorization": "Bearer ${value.token}",
            "DeviceCode": "M",
            "content-type": "application/json",
            "os": Platform.isAndroid
                ? "Android"
                : Platform.isIOS
                    ? "iOS"
                    : "",
            "appVersion": "1.0.0"
          });
      // final header = await getHeader();

      print(header);
      print(url);
      log(jsonEncode({"Id": deviceId}).toString() + "++++");

      final result = await http.post(
        url,
        body: jsonEncode({"Id": deviceId}),
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

class UtilitiesApi {
  UtilitiesUrl urls = UtilitiesUrl();
  Future<List<AirportData>?> getAirport() async {
    try {
      final url = Uri.parse(baseUrl + urls.airport);

      final header = await getHeader();

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

  Future<List<ClsCountriesJson>?> getCountry() async {
    try {
      final url = Uri.parse(baseUrl + urls.getCountry);

      final header = await getHeader();

      print(header);
      print(url);

      final result = await http.post(url, body: jsonEncode({}), headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = CountryResponse.fromJson(resultAsJson);
      // Helper().toastMessage(responseModel.);
      return responseModel.objCountry;
    } on http.ClientException catch (e) {
      log(e.message.toString() + "+++++");
    } catch (e) {
      log("Error :$e");
    }
    return null;
  }

  Future<List<ClsStatesJson>?> getState({required String countryCode}) async {
    try {
      final url = Uri.parse(baseUrl + urls.getState);

      final header = await getHeader();

      print(header);
      print(url);

      final result = await http.post(url, body: jsonEncode({"countryCode": countryCode}), headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = StateResponse.fromJson(resultAsJson);
      // Helper().toastMessage(responseModel.);
      return responseModel.objState;
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
    // try {
    final url = Uri.parse(baseUrl + urls.search);

    final header = await getHeader();

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
    // } on http.ClientException catch (e) {
    //   log(e.message.toString() + "+++++");
    //   throw Exception();
    //  } catch (e) {
    //   log("Error :$e");
    //  }
    // return null;
  }

  Future<RAirlineSearchResponse?> combinedRoundTrip(FlightSearchReqModel data) async {
    //   try {
    final url = Uri.parse(baseUrl + urls.combinedRoundTrip);

    final header = await getHeader();

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
    // } on http.ClientException catch (e) {
    //   log(e.message.toString() + "+++++");
    //   throw Exception();
    // } catch (e) {
    //   log("Error :$e");
    // }
    // return null;
  }

  Future<IRAirlineSearchResponse?> individualRoundTrip(FlightSearchReqModel data) async {
    try {
      final url = Uri.parse(baseUrl + urls.individualRoundTrip);

      final header = await getHeader();

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

  Future<FlightDetailsResponse?> flightDetails({itinId, fareId, providerCode}) async {
    try {
      final url = Uri.parse(baseUrl + urls.getFlightDetails);

      final header = await getHeader();

      print(header);
      print(url);
      log(jsonEncode({"itinId": itinId, "fareId": fareId, "providerCode": providerCode}).toString() + "++++");
      final result = await http.post(url,
          body: jsonEncode({"itinId": itinId, "fareId": fareId, "providerCode": providerCode}),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      log(resultAsJson.toString());
      final responseModel = FlightDetailsResponse.fromJson(resultAsJson);
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

  Future<FlightDetailsResponseIR?> flightDetailsR({required FlightDetailsRequestIR data}) async {
    try {
      final url = Uri.parse(baseUrl + urls.getFlightDetailsIR);

      final header = await getHeader();

      print(header);
      print(url);
      log(jsonEncode(data).toString() + "++++");
      final result = await http.post(url,
          body: jsonEncode(data),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      log(resultAsJson.toString());
      final responseModel = FlightDetailsResponseIR.fromJson(resultAsJson);
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

class PricingApi {
  final urls = PricingUrls();
  Future<PricingResponse?> pricingDetails({required PricingRequest request}) async {
    try {
      final url = Uri.parse(baseUrl + urls.getPricingDetails);

      final header = await getHeader();

      print(header);
      print(url);
      log("${jsonEncode(request)}++++");
      final result = await http.post(url,
          body: jsonEncode(request),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = PricingResponse.fromJson(resultAsJson);
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

  Future<BookingResponse?> bookTicket(BookingRequest data) async {
    try {
      final url = Uri.parse(baseUrl + urls.getBookingResponse);

      final header = await getHeader();

      print(header);
      print(url);
      log("${jsonEncode(data)}++++");
      final result = await http.post(url,
          body: jsonEncode(data),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = BookingResponse.fromJson(resultAsJson);
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

  Future<RepriceResponse?> getRepricing(RepricingRequest data) async {
    try {
      final url = Uri.parse(baseUrl + urls.getRePricingDetails);

      final header = await getHeader();

      print("Header : $header");
      print("URL :$url");
      log("Request Data : ${jsonEncode(data)}");
      final result = await http.post(url,
          body: jsonEncode(data),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      log(resultAsJson.toString());
      final responseModel = RepriceResponse.fromJson(resultAsJson);
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

class MyTripsApi {
  final urls = AirlineUrl();
  Future<AirlineTicketHistoryResponse?> getDetails({required String request}) async {
    try {
      final url = Uri.parse(baseUrl + urls.myTrips);

      final header = await getHeader();

      print({"status": request});
      print(url);
      log("${jsonEncode(request)}++++");
      final result = await http.post(url,
          body: jsonEncode({"status": request}),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = AirlineTicketHistoryResponse.fromJson(resultAsJson);
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

class ProfileApi {
  final urls = AccountUrl();
  Future<GetProfileResponse?> getProfileDetails() async {
    try {
      final url = Uri.parse(baseUrl + urls.getProfile);

      final header = await getHeader();

      print({});
      print(url);
      log("${jsonEncode({})}++++");
      final result = await http.post(url,
          body: jsonEncode({}),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = GetProfileResponse.fromJson(resultAsJson);
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

  Future<EditProfileResponse?> editProfile({required EditProfileRequest request}) async {
    try {
      final url = Uri.parse(baseUrl + urls.editProfile);

      final header = await getHeader();

      print({request});
      print(url);
      log("${jsonEncode(request)}++++");
      final result = await http.post(url,
          body: jsonEncode(request),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = EditProfileResponse.fromJson(resultAsJson);
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

class TransactionsApi {
  final urls = TransactionsUrl();
  Future<AccountStatementResponse?> getTransactions() async {
    try {
      final url = Uri.parse(baseUrl + urls.getTransactions);

      final header = await getHeader();

      print({});
      print(url);
      log("${jsonEncode({})}++++");
      final result = await http.post(url,
          body: jsonEncode({}),
          //  body: data.toJson(),
          headers: header);
      log(result.statusCode.toString());
      final resultAsJson = jsonDecode(result.body);
      //  log(resultAsJson.toString());
      final responseModel = AccountStatementResponse.fromJson(resultAsJson);
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
