import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

flightSearchAppBar(BuildContext context) {
  return AppBar(
    actions: [IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.edit_outlined))],
    title: Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: const [
            Text(
              'DEL\t',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            Text(
              '\tBOM',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ]),
          const Text(
            "5 April",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const Text(
            "1 Traveller",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const Text(
            "Economy",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
