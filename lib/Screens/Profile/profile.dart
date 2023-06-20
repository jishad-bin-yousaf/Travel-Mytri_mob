import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/Screens/widgets/error.dart';
import 'package:travel_mytri_mobile_v1/data/api.dart';

import '../../bottom_navigation.dart';
import '../../data/model/Profile/profile_models.dart';

class ProfileScreen extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetProfileResponse?>(
        future: ProfileApi().getProfileDetails(),
        builder: (context, snapshot) {
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
            countryController.text = data.countryId ?? '';
            cityController.text = data.city ?? '';
            stateController.text = data.stateId ?? '';
            pinCodeController.text = data.pincode ?? '';
            addressController.text = data.address ?? '';

            return Scaffold(
              appBar: AppBar(
                title: Text("My Profile"),
                centerTitle: false,
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
                          child: TextField(
                            controller: countryController,
                            decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("Country")),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0, top: 10, bottom: 10, left: 10),
                          child: TextField(
                            controller: stateController,
                            decoration: const InputDecoration(border: OutlineInputBorder(), label: Text("State")),
                          ),
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
                      ProfileApi().editProfile(request: EditProfileRequest(address: addressController.text, city: cityController.text, countryId: countryController.text, email: emailIDController.text, firstName: firstNameController.text, fullName: firstNameController.text, lastName: lastNameController.text, mobile: "", password: "", pincode: pinCodeController.text, stateId: stateController.text, userId: data.userId));
                    },
                    child: Text("UPDATE", style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(backgroundColor: secondaryColor, minimumSize: Size(MediaQuery.of(context).size.width - 40, 50)),
                  ),
                ],
              )),
            );
          }
        });
  }
}
