import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/get_weather/presentation/view/manager/cubit/weather_cubit.dart';
import 'package:weather/features/get_weather/presentation/view/search_page.dart';
import 'package:weather/features/get_weather/presentation/view/weather_body_page.dart';
import 'package:weather/features/get_weather/presentation/view/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state){
            if(state is WeatherLoading){
              return const Center(
                child: CircularProgressIndicator());
            }

            else if(state is WeatherFailure){
              return const Center(
                child: Text("Something went plasy try again"));
            }
            else if(state is WeatherSuccess){
              return WeatherBodyPage(weatherModel: state.weatherModel,);
            }

            else{
              return const HomePageBody();
            }
          }),
    );
  }
}

