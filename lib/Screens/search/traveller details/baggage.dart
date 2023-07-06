import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import '../../../data/model/Search/pricing_models.dart';

class BaggageDetailsPage extends StatefulWidget {
  BaggageDetailsPage({
    super.key,
    required this.data,
  });
  List<PricingBaggageSegment> data;
  @override
  State<BaggageDetailsPage> createState() => _BaggageDetailsPageState();
}

class _BaggageDetailsPageState extends State<BaggageDetailsPage> {
  int? sectionIndex;
  late List<SSRBaggage> baggageList;
  int selectedIndexBag = -1;
  int selectedIndexSector = -1;

  @override
  void initState() {
    baggageList = List.generate(widget.data.length ?? 0, (index) => SSRBaggage(amount: 0, name: '', segmentCode: '', tripMode: '', key: ""));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: InkWell(
          onTap: () {
            log(baggageList.toString());
            Navigator.pop(context, baggageList);
          },
          child: Container(
            color: primaryColor,
            height: 80,
            width: double.infinity,
            child: const Center(
                child: Text(
              "CONTINUE",
              style: TextStyle(color: white, fontSize: 25, fontWeight: FontWeight.w600),
            )),
          )),
      appBar: AppBar(
        title: Text("Add Baggage"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 60.0,
            child: ListView.builder(
              itemCount: widget.data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndexSector == index;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      selectedIndexSector = isSelected ? -1 : index;
                      selectedIndexBag = -1;
                      sectionIndex = index;
                      baggageList[index].segmentCode = widget.data[index].sectorCode;
                      baggageList[index].tripMode = widget.data[index].tripMode;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: isSelected ? secondaryColor : Colors.grey.shade300),
                    child: Text(
                      widget.data[index].sectorCode ?? '',
                      style: TextStyle(color: isSelected ? white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          sectionIndex != null
              ? Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return GridView.builder(
                        physics: const ScrollPhysics(),
                        itemCount: widget.data[sectionIndex!].objbaggageList?.length ?? 0,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 150,
                            crossAxisCount: constraints.maxWidth > 620 ? 6 : 3,
                            crossAxisSpacing: 5,
                            childAspectRatio: constraints.maxWidth < 620 ? MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.5) : MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 0.9),
                            //  maxCrossAxisExtent: 200,
                            mainAxisSpacing: 10),
                        itemBuilder: (BuildContext ctx, int index) {
                          bool isSelected = selectedIndexBag == index;

                          final data = widget.data[sectionIndex!].objbaggageList?[index];
                          return InkWell(
                              onTap: () {
                                selectedIndexBag = isSelected ? -1 : index;
                                if (!isSelected) {
                                  baggageList[sectionIndex!].name = widget.data[sectionIndex!].objbaggageList?[index].name;
                                  baggageList[sectionIndex!].amount = widget.data[sectionIndex!].objbaggageList?[index].amount;
                                  baggageList[sectionIndex!].key = widget.data[sectionIndex!].objbaggageList?[index].code;
                                } else {
                                  baggageList[sectionIndex!].name = '';
                                  baggageList[sectionIndex!].amount = 0;
                                  baggageList[sectionIndex!].key = '';
                                }
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade200,
                                  border: Border.all(width: 2, color: isSelected ? primaryColor : Colors.grey.shade400),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/icons/baggage.png",
                                      height: 60,
                                      width: 60,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        data?.name ?? '',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Text(
                                      "₹ ${data?.amount ?? ''}",
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ));
                        },
                      );
                    },
                  ),
                )
              : const SizedBox(
                  child: Text("Please Select a sector from above"),
                ),
        ],
      )),
    );
  }
}
