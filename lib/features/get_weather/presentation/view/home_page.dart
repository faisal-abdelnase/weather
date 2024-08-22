import 'package:flutter/material.dart';
import 'package:weather/features/get_weather/presentation/view/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("My Weather", 
        style: TextStyle(
          color: Colors.white,
        ),),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 32,
              ),
              ),
        ],
        ),

        body: const Center(
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
        ),
    );
  }
}