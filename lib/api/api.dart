// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/datapred.dart';

// class DataProvider with ChangeNotifier{
//   DataProvider() {
//     this.fetchTasks();
//   }

//   List<Datapred> _datapred = [];
//   List<Datapred> get datas{
//     return [..._datapred];
//   }


//   fetchTasks() async{
//     final url = "http://127.0.0.1:8000/api/?Date=2021-06-13";
//     final response = await http.get(url);
//     if(response.statusCode = 200 ){
//       var data = json.decode(response.body) as List;
//       _datapred = data.map<Datapred>((json) => Datapred.fromJson(json)).toList();
//     }
//   }

// }

