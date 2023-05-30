import 'dart:developer';

import 'package:hive/hive.dart';

import 'Search/flight_search_model.dart';
part '../gen/hive_class_functions.g.dart';

@HiveType(typeId: 1)
class Token {
  @HiveField(0)
  String? token;
}

Future<String> setToken(Token token) async {
  IRAirlineSearchResponse(
    status: true,
    responseMessage: "Success",
    airlineClass: null,
    origin: "Calicut",
    destination: "Dubai",
    departureDate: DateTime.now(),
    originR: "Calicut",
    destinationR: "Dubai",
    returnDate: DateTime.now(),
    adult: 1,
    child: 0,
    infant: 0,
    minimumFare: 5000.0,
    maximumFare: 50000.0,
    minimumFareR: 4000.0,
    maximumFareR: 40000.0,
    objAvlairlineList: null,
    objItinList: [
      const Apisearchresponse(
        itinId: null,
        providerCode: null,
        airlineName: "Indigo",
        airlineCode: "ai",
        flightDetails: "6E 325",
        source: "CCJ",
        destination: "DXB",
        origin: null,
        departureDate: "23 Mar 2023",
        arrivalDate: "23 Mar 2023",
        departureTime: "22:30",
        arrivalTime: "01:30",
        duration: " 04 hr 00 min",
        freeBaggage: "20 KG BAGGAGE",
        refundable: "No",
        sourceAirport: "Calicut",
        destinationAirport: "Dubai",
        noofSeat: 1,
        amount: 5000.0,
        discount: 4500.0,
        netAmount: 4500.0,
        noofStop: 0,
        segmentDetails: "",
        pricingList: null,
      ),
      const Apisearchresponse(
        itinId: null,
        providerCode: null,
        airlineName: "Indigo",
        airlineCode: "ai",
        flightDetails: "6E 325",
        source: "CCJ",
        destination: "DXB",
        origin: null,
        departureDate: "23 Mar 2023",
        arrivalDate: " 23 Mar 2023",
        departureTime: "22:30",
        arrivalTime: "01:30",
        duration: "04 hr 00 min",
        freeBaggage: "20 KG BAGGAGE",
        refundable: "",
        sourceAirport: "Calicut",
        destinationAirport: "Dubai",
        noofSeat: 1,
        amount: 5000.0,
        discount: 4500.0,
        netAmount: 4500.0,
        noofStop: 0,
        segmentDetails: "",
        pricingList: [PricingBasic()],
      ),
    ],
    objItinListR: const [
      Apisearchresponse(
        itinId: null,
        providerCode: null,
        airlineName: "Indigo",
        airlineCode: "6E",
        flightDetails: "6E 325",
        source: "CCJ",
        destination: "DXB",
        origin: null,
        departureDate: "23 Mar 2023",
        arrivalDate: "23 Mar 2023",
        departureTime: "22:30",
        arrivalTime: "01:30",
        duration: "04 hr 00 min",
        freeBaggage: "20 KG BAGGAGE",
        refundable: "",
        sourceAirport: "Calicut",
        destinationAirport: "Dubai",
        noofSeat: 1,
        amount: 5000.0,
        discount: 4500.0,
        netAmount: 4500.0,
        noofStop: 0,
        segmentDetails: "",
        pricingList: null,
      ),
      Apisearchresponse(
        itinId: null,
        providerCode: null,
        airlineName: "Indigo",
        airlineCode: "6E",
        flightDetails: "6E 325",
        source: "CCJ",
        destination: "DXB",
        origin: null,
        departureDate: "23 Mar 2023",
        arrivalDate: "23 Mar 2023",
        departureTime: "22:30",
        arrivalTime: "01:30",
        duration: " 04 hr 00 min",
        freeBaggage: "20 KG BAGGAGE",
        refundable: '',
        sourceAirport: "Calicut",
        destinationAirport: "Dubai",
        noofSeat: 1,
        amount: 5000.0,
        discount: 4500.0,
        netAmount: 4500.0,
        noofStop: 0,
        segmentDetails: '',
        pricingList: null,
      ),
    ],
  );
  final tokenDB = await Hive.openBox<Token>("token_DB");

  log(tokenDB.length.toString());

  try {
    if (tokenDB.isEmpty) {
      tokenDB.add(token);
      log(tokenDB.length.toString());
      log(tokenDB.values.last.token.toString());

      // tokenDB.close();
    } else {
      log("Elseeeeeeee");
      log("Before clr " + tokenDB.length.toString());
      tokenDB.clear();
      log("after clr " + tokenDB.length.toString());
      tokenDB.add(token);

      log("after add " + tokenDB.length.toString());
      log(tokenDB.values.last.token.toString());
      //  getToken();
      return tokenDB.values.last.token ?? "";
    }
  } catch (e) {
    log(e.toString());
  }
  return '';
}

Future<String> getToken() async {
  final tokenDB = await Hive.openBox<Token>("token_DB");
  print(tokenDB.length);
  try {
    final token = tokenDB.values.first.token;
    // log(tokenDB.values.first.token.toString());
    // tokenDB.close();

    return token ?? '';
  } catch (e) {
    // log(tokenDB.values.first.token.toString());
    tokenDB.close();

    log(e.toString());
  }
  // tokenDB.close();

  return "";
}
