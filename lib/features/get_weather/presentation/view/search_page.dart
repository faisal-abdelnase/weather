import 'package:flutter/material.dart';
import 'package:weather/features/get_weather/presentation/view/weather_body_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String? cityName;

  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white
        ),
        title: const Text("Search City", 
        style: TextStyle(
          color: Colors.white,

        ),
        ),
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return "filed is require";
                }
                else{
                  return null;
                }
              },
        
              onFieldSubmitted: (value) {
                cityName = value;
                if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const WeatherBodyPage()));

              } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },

              onChanged: (value) {
                cityName = value;
              },
        
        
              decoration:  InputDecoration(
                hintText: "Enter a City",
                hintStyle: const TextStyle(
                  color: Colors.grey
                ),
                label: const Text("Search"),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                  } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                }
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 32,
                    color: Colors.blue,
                    ),
                  
                  ),
                border: const OutlineInputBorder(
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16)
              ),
            ),
          ),
        ),
      ),
    );
  }
}