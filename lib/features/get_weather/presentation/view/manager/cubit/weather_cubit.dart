import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/core/services/weather_api.dart';
import 'package:weather/features/get_weather/presentation/data/model/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherApi) : super(WeatherInitial());

  WeatherApi weatherApi;

  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName}) async{

    emit(WeatherLoading());

    try{

      weatherModel = await weatherApi.getWeather(cityName: cityName);
      if(weatherModel != null){
        emit(WeatherSuccess(weatherModel: weatherModel));
      }

      else{
        emit(WeatherFailure());
      }
      

    }catch(e){
      emit(WeatherFailure());
    }
  }
}
