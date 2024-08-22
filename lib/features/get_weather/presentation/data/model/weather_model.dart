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
}