
import 'package:dio/dio.dart';
import 'package:weather/features/get_weather/presentation/data/model/weather_model.dart';

class WeatherApi {
  final Dio dio;

  WeatherApi(this.dio);

  Future<WeatherModel?> getWeather({required String cityName}) async{

    WeatherModel? weather;

    try{

      Response response = 
      await dio.get("http://api.weatherapi.com/v1/forecast.json?key=d9564fc6a87b4d2f844162959232206&q=$cityName&days=7");

      Map<String, dynamic> jsonData = response.data;
      
      if(response.statusCode == 1006){
        return weather;
      }

      weather = WeatherModel.fromJson(jsonData);


    }catch(e){
      print(e);
    }

    return weather;

  }
}