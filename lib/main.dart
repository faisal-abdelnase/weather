import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/services/weather_api.dart';
import 'package:weather/features/get_weather/presentation/view/home_page.dart';
import 'package:weather/features/get_weather/presentation/view/manager/cubit/weather_cubit.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherApi(Dio())),
    child: const Weather(),
  ));
}

class Weather extends StatelessWidget {
  const Weather({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
          primarySwatch:
              BlocProvider.of<WeatherCubit>(context).weatherModel == null
                  ? Colors.blue
                  : BlocProvider.of<WeatherCubit>(context)
                      .weatherModel!
                      .getColor()),
      home: const HomePage(),
    );
  }
}
