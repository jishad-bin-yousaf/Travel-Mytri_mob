import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/data/model/Search/flight_search_model.dart';

class BaggageDetailsPage extends StatefulWidget {
  BaggageDetailsPage(this.data, {super.key});
  List<PricingBaggageSegment>? data;
  @override
  State<BaggageDetailsPage> createState() => _BaggageDetailsPageState();
}

class _BaggageDetailsPageState extends State<BaggageDetailsPage> {
  int sectionIndex = 0;

  int selectedIndexBag = -1;
  int selectedIndexSector = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Baggage"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 60.0,
            child: ListView.builder(
              itemCount: widget.data?.length ?? 0,
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
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: isSelected ? secondaryColor : Colors.grey.shade300),
                    child: Text(
                      widget.data?[index].sectorCode ?? '',
                      style: TextStyle(color: isSelected ? white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return GridView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: widget.data?[sectionIndex].objbaggageList?.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 150,
                      crossAxisCount: constraints.maxWidth > 620 ? 6 : 3,
                      crossAxisSpacing: 5,
                      childAspectRatio: constraints.maxWidth < 620 ? MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.5) : MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 0.9),
                      //  maxCrossAxisExtent: 200,
                      mainAxisSpacing: 10),
                  itemBuilder: (BuildContext ctx, int index) {
                    bool isSelected = selectedIndexBag == index;

                    final data = widget.data?[sectionIndex].objbaggageList?[index];
                    return InkWell(
                        onTap: () {
                          selectedIndexBag = isSelected ? -1 : index;
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
          ),
        ],
      )),
    );
  }
}
