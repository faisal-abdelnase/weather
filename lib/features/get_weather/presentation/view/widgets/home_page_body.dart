import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("there is no weather 😔 start", 
          style: TextStyle(
            fontSize: 24,
          ),),
          Text("searching now 🔍", 
          style: TextStyle(
            fontSize: 24,
          ),),
        ],
      ),
    );
  }
}