import 'package:flutter/material.dart';
import 'package:travel_mytri_mobile_v1/Constants/colors.dart';
import 'package:travel_mytri_mobile_v1/data/model/Transactions/transactions_model.dart';

import '../../bottom_navigation.dart';
import '../../data/api.dart';
import '../../data/model/hive_class_functions.dart';
import '../widgets/error.dart';
import '../widgets/login_error.dart';

class MyTransactionsScreen extends StatelessWidget {
  MyTransactionsScreen({super.key});
  AccountStatementResponse data = AccountStatementResponse();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Token>(
        future: getToken(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while waiting for the result
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display an error message if the asynchronous operation fails
            return Text('Error: ${snapshot.error}');
          } else {
            return (snapshot.data?.isUser ?? false)
                ? FutureBuilder<AccountStatementResponse?>(
                    future: TransactionsApi().getTransactions(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Display a loading indicator while waiting for the result
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        // Display an error message if the asynchronous operation fails
                        return ErrorPage();
                      } else {
                        // The asynchronous operation completed successfully
                        final data = snapshot.data ?? AccountStatementResponse();
                        if (((data.objDaywiseStatement ?? []).isNotEmpty)) {
                          return Scaffold(
                            appBar: AppBar(
                              toolbarHeight: 80,
                              title: Text(
                                "My Transactions",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            bottomNavigationBar: const BottomNavigation(),
                            body: SafeArea(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(15)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "TravelMythri Wallet",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        Text(
                                          "₹ ${data.totalAmount ?? 0}",
                                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      child: ListView.builder(
                                    itemCount: data.objDaywiseStatement?.length ?? 0,
                                    itemBuilder: (context, dayWiseIndex) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data.objDaywiseStatement?[dayWiseIndex].date ?? '',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                                height: 80 * (data.objDaywiseStatement?[dayWiseIndex].objAccountStatement?.length ?? 0).toDouble(),
                                                child: ListView.separated(
                                                  itemCount: data.objDaywiseStatement?[dayWiseIndex].objAccountStatement?.length ?? 0,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemBuilder: (context, index) {
                                                    final value = data.objDaywiseStatement?[dayWiseIndex].objAccountStatement?[index];
                                                    return ListTile(
                                                      leading: CircleAvatar(
                                                          backgroundColor: Colors.grey.shade400,
                                                          child: Icon(
                                                            Icons.person,
                                                            color: Colors.black,
                                                          )),
                                                      title: Text(
                                                        value?.transactionDetails ?? "",
                                                        style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      subtitle: Text("${value?.time ?? ""} \n ${value?.transactionType ?? ""}"),
                                                      trailing: Text("${value?.amount ?? ""}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                                    );
                                                  },
                                                  separatorBuilder: (context, index) => Divider(thickness: 2),
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                  )),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Scaffold(
                              backgroundColor: Colors.grey.shade300,
                              appBar: AppBar(
                                title: Text("My Transactions"),
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
                                        "assets/images/no-data.png",
                                        height: 200,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Text(
                                          "No data found!",
                                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      // const Padding(
                                      //   padding: EdgeInsets.all(5.0),
                                      //   child: Text(
                                      //     "You need to login to access this page",
                                      //     maxLines: 2,
                                      //     style: TextStyle(fontSize: 15),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                              ));
                        }
                      }
                    })
                : Scaffold(
                    backgroundColor: Colors.grey.shade300,
                    bottomNavigationBar: const BottomNavigation(),
                    body: LoginErrorPage(),
                  );
          }
        });
  }
}
