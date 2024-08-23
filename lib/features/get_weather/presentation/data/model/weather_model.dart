

import 'package:flutter/material.dart';

class WeatherModel {
  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weahterStateName;

  WeatherModel(
    {required this.date, 
    required this.temp, 
    required this.maxTemp, 
    required this.minTemp, 
    required this.weahterStateName});


factory WeatherModel.fromJson(dynamic data){
  var jsonData = data['forecast']['forecastday'][0]['day'];

  return WeatherModel(
    date: DateTime.parse(data['location']['localtime']), 
    temp: jsonData['avgtemp_c'], 
    maxTemp: jsonData['maxtemp_c'],
    minTemp: jsonData['mintemp_c'], 
    weahterStateName: jsonData['condition']['text']);
}

String getImage(){
  switch(weahterStateName){
    case "Moderate rain":
      return "asset/images/thunderstorm.png";
    case 'Sleet':
    case 'Snow':
    case 'Hail':
      return "asset/images/snow.png";
    case "Partly cloudy":
      return 'asset/images/cloudy.png';
    case 'Light Rain':
    case 'Heavy Rain':
    case 'Showers':
      return "asset/images/rainy.png";
    case 'Clear':
    case 'Light Cloud':
      return "asset/images/clear.png";

    default: return "asset/images/clear.png";
  }
}




MaterialColor getColor(){
  switch(weahterStateName){
    case "Moderate rain":
      return Colors.grey;
    case 'Sleet':
    case 'Snow':
    case 'Hail':
      return Colors.blue;
    case "Partly cloudy":
      return Colors.blueGrey;
    case 'Light Rain':
    case 'Heavy Rain':
    case 'Showers':
      return Colors.blue;
    case 'Clear':
    case 'Light Cloud':
      return Colors.orange;

    default: return Colors.orange;
  }
}



}