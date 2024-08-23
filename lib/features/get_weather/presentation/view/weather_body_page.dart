import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/get_weather/presentation/data/model/weather_model.dart';
import 'package:weather/features/get_weather/presentation/view/manager/cubit/weather_cubit.dart';

class WeatherBodyPage extends StatelessWidget {
  const WeatherBodyPage({super.key, required this.weatherModel});

  final WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      
      //   backgroundColor: Colors.orange,
      //   title: const Text("My Weather", 
      //   style: TextStyle(
      //     fontWeight: FontWeight.bold,
      //   ),),
      //   actions: [
      //     IconButton(
      //       onPressed: (){
      //         Navigator.of(context).push(
      //           MaterialPageRoute(builder: (context) => const SearchPage()));
      //       },
      //       icon: const Icon(
      //         Icons.search,
      //         size: 32,
      //         ),
      //         ),
      //   ],
      //   ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                weatherModel!.getColor(),
                weatherModel!.getColor()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(BlocProvider.of<WeatherCubit>(context).cityName!, 
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                ),
          
                Text("updated at ${weatherModel!.date.hour.toString()} : ${weatherModel!.date.minute.toString()}", 
                style: const TextStyle(
                  fontSize: 20,
                ),
                ),
                const SizedBox(
                  height: 64,
                ),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(weatherModel!.getImage()),
                    Text("${weatherModel!.temp.toInt()}",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
          
                    Column(
                      children: [
                        Text("maxTemp : ${weatherModel!.maxTemp.toInt()}"),
                        Text("minTemp : ${weatherModel!.minTemp.toInt()}"),
                      ],
                    ),
                  ],
                ),
          
                const SizedBox(
                  height: 64,
                ),
          
                Text(weatherModel!.weahterStateName, 
                style: const TextStyle(
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