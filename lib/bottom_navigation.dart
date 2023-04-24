import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/main.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LaunchScreen.selectedIndexNotifier,
      builder: (BuildContext context, int updatedIndex, Widget? _) {
        return Card(
          margin: EdgeInsets.zero,
          color: const Color.fromARGB(255, 221, 227, 234),
          child: CustomNavigationBar(
            elevation: 0,
            iconSize: 30.0,

            selectedColor: primaryColor,
            strokeColor: tertiaryColor,
            unSelectedColor: Colors.black,
            backgroundColor: const Color.fromARGB(255, 221, 227, 234),

            isFloating: true,
            //   borderRadius: const Radius.circular(5),
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                title: const Text("Home", style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.person_2_outlined),
                title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.card_travel_rounded),
                title: const Text("My Trips", style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.notifications_active_outlined),
                title: const Text("Notification", style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ],
            currentIndex: updatedIndex,
            onTap: (newIndex) {
              LaunchScreen.selectedIndexNotifier.value = newIndex;
            },
          ),
        );
      },
    );
  }
}
