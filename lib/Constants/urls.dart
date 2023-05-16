class AirlineUrl {
  String getAirlineTicketHistory = "/api/Airline/GetAirlineTicketHistory";
  String airport = "/api/ControlPanel/GetAirport";
}

class SearchUrl {
  String search = "/api/AirlineSearch/GetAirlineAvailability";
  String combinedRoundTrip = "/api/AirlineSearch/GetAirlineAvailabilityCRT";
  String individualRoundTrip = "/api/AirlineSearch/GetAirlineAvailabilityIRT";
}

class AuthenticationUrl {
  String authenticate = "/api/Account/Authenticate";
  String startingApi = "/api/Account/DefaultAuthenticate";
  String otpSubmit = "/api/Account/OtpSubmitForAuthentication";
}
