import 'package:flutter/material.dart';
import 'package:weather/features/get_weather/presentation/view/search_page.dart';

class WeatherBodyPage extends StatelessWidget {
  const WeatherBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Colors.orange,
        title: const Text("My Weather", 
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            icon: const Icon(
              Icons.search,
              size: 32,
              ),
              ),
        ],
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange,
                Colors.orange[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Cairo", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                ),
          
                const Text("updated at 0 : 52", 
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
                const SizedBox(
                  height: 64,
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("asset/images/clear.png"),
                    const Text("31",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
          
                    const Column(
                      children: [
                        Text("maxTemp : 38"),
                        Text("minTemp : 27"),
                      ],
                    ),
                  ],
                ),
          
                const SizedBox(
                  height: 64,
                ),
          
                const Text("Sunny", 
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),)
              ],
            ),
          ),
        ),

    );
  }
}