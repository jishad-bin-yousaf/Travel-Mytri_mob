import 'package:flutter/material.dart';

import '../bottom_navigation.dart';

class MyTransactionsScreen extends StatefulWidget {
  const MyTransactionsScreen({super.key});

  @override
  State<MyTransactionsScreen> createState() => _MyTransactionsScreenState();
}

class _MyTransactionsScreenState extends State<MyTransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Transactions"),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: const SafeArea(child: SizedBox()),
    );
  }
}
