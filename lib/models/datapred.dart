// class Datapred{
//     final int pm10;
//     final int no2;
//     final int so2;
//     final int o3;
//     final int aqi;
//     Datapred({this.aqi,this.no2,this.o3,this.pm10,this.so2});

//     factory Datapred.fromJson(Map<int,dynamic> json){
//       return Datapred(
//         aqi: json['AQI'],no2: json['NO2'],o3: json['O3'],pm10: json['PM10'],so2: json['SO2']
//       );
//     }
// }


// import 'package:intl/intl.dart';
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState(){
//     return _MyHomePageState();
//   } 
// }


// class _MyHomePageState extends State<MyHomePage> {


//   getApiData(dynamic s) async{
//     print('Yaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaayyyyyyy');
//     String url = 'http://vc8006.pythonanywhere.com/api/?Date=$s';
//     http.Response respons = await http.get(Uri.parse(url));
//     String val = respons.body;
//     List<dynamic> data = jsonDecode(val);
//     if(respons.statusCode == 200){
//       print('sucess');
//       print(data[0]['Date']);
//     }else{
//       print('oops.............!!!');
//     }
//   }

//   // DateTime date = DateTime.now();
//   final dateFormat = DateFormat('yyyy-MM-dd');
  
//   @override
//   Widget build(BuildContext context) {
//     // String _formattedate = new DateFormat.yMMMd().format(_currentdate);
//     String _formattedate = dateFormat.format(_currentdate);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Date'),
//         actions: <Widget>[
//           IconButton(onPressed: (){
//             _selectdate(context);
//           },icon: Icon(Icons.calendar_today),)
//         ],
//       ),
//       body: Center(child: Text('Date: $_formattedate ')),
//     );
//       // body: Center(
//       //   child: Column(
//       //     children: [
//       //       Text('Pick Date'),
//       //       TextButton(onPressed: (){
//       //         print('enter');
//       //         // showDatePicker(
//       //         //   context: context, 
//       //         //   initialDate: DateTime.now(), 
//       //         //   firstDate: DateTime(2015), 
//       //         //   lastDate: DateTime.now().add(Duration(days: 7))
//       //         //   ).then((value){
//       //         //     print(value);
//       //         //     print(dateFormat.format(value!));
//       //         //     getApiData(dateFormat.format(value));

//       //           // });
//       //       },
//       //       child: Text(
//       //         'pick Date',
//       //       )),
//       //       Text('AQI'),
//       //       TextButton(onPressed: (){
//       //         // getApiData();
//       //       },
//       //       child: Text(
//       //         'Call Api',
//       //       ))
//       //     ],
//       //   ),
//       // ),
//     // );
//   }
// }

// print(selectedDate);
                // showDatePicker(
                //   context: context,
                //   initialDate: (date == null) ? DateTime.now() : date,
                //   firstDate: DateTime(2015),
                //   lastDate: DateTime.now().add(Duration(days: 7)),
                // ).then((value) {
                //   setState(() {
                //     date = value!;
                //   }
                //   );
                  
                //   // getApiData('date.toString()');
                //   getApiData('2021-06-01');

                // });