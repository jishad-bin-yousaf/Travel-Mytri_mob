class AirlineUrl {
  String getAirlineTicketHistory = "/api/Airline/GetAirlineTicketHistory";
  String airport = "/api/ControlPanel/GetAirport";
  String myTrips = "/api/Airline/GetAirlineTicketHistory";
}

class SearchUrl {
  String search = "/api/AirlineSearch/GetAirlineAvailability";
  String combinedRoundTrip = "/api/AirlineSearch/GetAirlineAvailabilityCRT";
  String individualRoundTrip = "/api/AirlineSearch/GetAirlineAvailabilityIRT";
  String getFlightDetails = "/api/AirlineSearch/GetFlightDetails";
  String getFlightDetailsIR = "/api/AirlineSearch/GetFlightDetailsIR";
}

class PricingUrls {
  String getPricingDetails = "/api/Pricing/GetPricingDetails";
  String getRePricingDetails = "/api/Pricing/GetRePricingDetails";
  String getBookingResponse = "/api/Booking/GetBookingResponse";
}

class AuthenticationUrl {
  String authenticate = "/api/Account/Authenticate";
  String startingApi = "/api/Account/DefaultAuthenticate";
  String otpSubmit = "/api/Account/OtpSubmitForAuthentication";
}

class AccountUrl {
  String editProfile = "/api/Account/EditProfile";
  String getProfile = "/api/Account/GetProfile";
}
