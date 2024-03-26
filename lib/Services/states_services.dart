import 'dart:convert';

import 'package:covid_app_tracker/Model/World_states_model.dart';
import 'package:covid_app_tracker/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices
{
Future<WorldStatesModel> fetchWorldStatesRecord() async
{
  final response = await http.get(Uri.parse(AppUrl.baseUrl));

  if(response.statusCode == 200)
    {
      var data = jsonDecode(response.body);
     return WorldStatesModel.fromJson(data);
    }
  else{
    throw Exception('Error');
  }

}
}