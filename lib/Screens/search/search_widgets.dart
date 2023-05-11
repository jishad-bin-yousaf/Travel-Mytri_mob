import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../data/model/Search/flight_search_model.dart';

flightSearchAppBar(BuildContext context, AirlineSearchResponse data) {
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
          Row(children: [
            Text(
              '${data.origin ?? "N/A"}\t',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            Text(
              '\t${data.destination ?? "N/A"}',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
            ),
          ]),
          Text(
            '${data.departureDate ?? "Date"}',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Text(
            "${data.passengers ?? "0"} Traveller",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          Text(
            data.airlineClass ?? "airline Class",
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
