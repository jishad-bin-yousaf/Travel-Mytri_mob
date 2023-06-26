import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/error.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/helper.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';

import '../../bottom_navigation.dart';
import '../../data/model/Profile/profile_models.dart';
import '../../data/model/hive_class_functions.dart';
import '../../data/model/utilities.dart';
import '../Login/login_pop_up.dart';

class ProfileScreen extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  List<ClsCountriesJson> countryList = [];
  String? countryCode;
  String? stateCode;
  List<ClsStatesJson> stateList = [];
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetProfileResponse?>(
        future: ProfileApi().getProfileDetails(),
        builder: (context, snapshot) {
          UtilitiesApi().getCountry().then((value) {
            countryList = value ?? [];
          });
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for the result
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display an error message if the asynchronous operation fails
            return ErrorPage();
          } else {
            // The asynchronous operation completed successfully
            final data = snapshot.data ?? GetProfileResponse();
            firstNameController.text = data.firstName ?? '';
            lastNameController.text = data.lastName ?? '';
            emailIDController.text = data.email ?? '';
            countryController.text = data.country ?? '';
            cityController.text = data.city ?? '';
            stateController.text = data.state ?? '';
            pinCodeController.text = data.pincode ?? '';
            addressController.text = data.address ?? '';
            countryCode = data.countryId;
            stateCode = data.stateId;
            if (data.status ?? false) {
              return Scaffold(
                appBar: AppBar(
                  title: Text("My Profile"),
                  centerTitle: false,
                  actions: [
                    IconButton(
                        icon: const Icon(Icons.logout),
                        onPressed: () {
                          AuthenticationApi().logOut(userId: data.userId.toString()).then((value) {
                            if (value?.status ?? false) {
                              AuthenticationApi().noUserLogin().then((value) {
                                Token toc = Token();
                                if (value?.token != null) {
                                  toc.token = value?.token ?? '';
                                  setToken(toc);
                                }
                                (value?.status ?? false)
                                    ? Future.delayed(const Duration(seconds: 2), () {
                                        getToken().then((value) {
                                          Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));
                                        });
                                      }
                                        //  () => Navigator.pushNamedAndRemoveUntil(context, '/FlightSearchResult', ModalRoute.withName('/FlightSearchResult')),
                                        )
                                    : Future.delayed(const Duration(seconds: 2), () {
                                        getToken().then((value) {
                                          Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));
                                        });
                                      }
                                        // Future.delayed(const Duration(seconds: 5), () {
                                        //     getToken().then((value) {
                                        //       Navigator.pushNamedAndRemoveUntil(context, '/', ModalRoute.withName('/'));
                                        //     });
                                        //   }
                                        //  () => Navigator.pushNamedAndRemoveUntil(context, '/FlightSearchResult', ModalRoute.withName('/FlightSearchResult')),
                                        );
                              });
                            }
                          });
                        })
                  ],
                ),
                bottomNavigationBar: const BottomNavigation(),
                body: SafeArea(
                    child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      child: const Text(
                        "Basic info, for a faster booking experience",
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: TextField(
                        controller: firstNameController,
                        decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("First Name")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: TextField(
                        controller: lastNameController,
                        decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Last Name")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: TextField(
                        controller: emailIDController,
                        decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Email ID")),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10, right: 10),
                            child: TypeAheadField<ClsCountriesJson>(
                                hideSuggestionsOnKeyboardHide: false,
                                debounceDuration: const Duration(milliseconds: 500),
                                suggestionsCallback: (query) async => getCountryList(query),
                                itemBuilder: (context, itemData) => ListTile(
                                      title: Text("${itemData.name ?? ''}"),
                                    ),
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: countryController,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    label: const Text("Country"),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                noItemsFoundBuilder: (context) => const SizedBox(
                                      height: 80,
                                      child: Center(child: Text("No Countries Found")),
                                    ),
                                onSuggestionSelected: (suggestion) {
                                  countryController.text = suggestion.name ?? '';
                                  countryCode = suggestion.countryCode;
                                  UtilitiesApi().getState(countryCode: countryCode ?? '').then((value) {
                                    stateList = value ?? [];
                                  });
                                }),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0, top: 10, bottom: 10, left: 10),
                            child: TypeAheadField<ClsStatesJson>(
                                hideSuggestionsOnKeyboardHide: false,
                                debounceDuration: const Duration(milliseconds: 0),
                                suggestionsCallback: (query) async => getStateList(query),
                                itemBuilder: (context, itemData) => ListTile(
                                      title: Text("${itemData.name ?? ''}"),
                                    ),
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: stateController,
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    label: const Text("State"),
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                noItemsFoundBuilder: (context) => const SizedBox(
                                      height: 80,
                                      child: Center(child: Text("No States Found")),
                                    ),
                                onSuggestionSelected: (suggestion) {
                                  stateController.text = suggestion.name ?? '';
                                  stateCode = suggestion.stateCode;
                                }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10, right: 10),
                            child: TextField(
                              controller: cityController,
                              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("City")),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0, top: 10, bottom: 10, left: 10),
                            child: TextField(
                              controller: pinCodeController,
                              decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Pin Code")),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: SizedBox(
                        height: 150.0, // Adjust the height value as per your requirement
                        child: TextField(
                          controller: addressController,
                          maxLines: 5, // Set maxLines to 3 for three lines of text
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Address",
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ProfileApi()
                            .editProfile(
                                request: EditProfileRequest(
                              address: addressController.text,
                              city: cityController.text,
                              countryId: countryCode,
                              email: emailIDController.text,
                              firstName: firstNameController.text,
                              fullName: firstNameController.text,
                              lastName: lastNameController.text,
                              mobile: "",
                              password: "",
                              pincode: pinCodeController.text,
                              stateId: stateCode,
                              userId: data.userId,
                            ))
                            .then(
                              (value) => (value?.status ?? false) ? Helper().toastMessage("Profile Updated Successfully") : null,
                            );
                      },
                      child: Text(
                        "UPDATE",
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: secondaryColor, minimumSize: Size(MediaQuery.of(context).size.width - 40, 50)),
                    ),
                  ],
                )),
              );
            } else {
              return Scaffold(
                  backgroundColor: Colors.grey.shade300,
                  appBar: AppBar(
                    title: Text("My Profile"),
                    centerTitle: false,
                  ),
                  bottomNavigationBar: const BottomNavigation(),
                  body: SafeArea(
                    child: Center(
                      child: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/login.png",
                            height: 150,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "Login to Continue",
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text(
                              "You need to login to access this page",
                              maxLines: 2,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: ElevatedButton(
                              onPressed: () {
                                loginBottomSheet(context, MediaQuery.of(context).size.width);
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(200, 50),
                                backgroundColor: secondaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: const Text("LOGIN", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }
          }
        });
  }

  getCountryList(String query) {
    List<ClsCountriesJson> filteredCountries = [];

    final cityCodeList = countryList.where((element) => element.name!.toLowerCase().startsWith(query.toLowerCase())).toList();
    filteredCountries.addAll(cityCodeList);

    log(filteredCountries.toString());

    return filteredCountries;
  }

  getStateList(String query) {
    List<ClsStatesJson> filteredStates = [];

    final cityCodeList = stateList.where((element) => element.name!.toLowerCase().startsWith(query.toLowerCase())).toList();
    filteredStates.addAll(cityCodeList);

    log(filteredStates.toString());

    return filteredStates;
  }
}
