   // }

//         Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage("Images/bg.jpg"),
//             fit: BoxFit.cover,
//           ),
//         ),
//        child : Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//           // Text((selectedDate == null) ? 'Picke date!!' : dateFormate.format(selectedDate)),
//             // Text((aqi == null) ? 'Select date to get data!' : 'AQI : $aqi, PM10 : $pm10, NO2 : $no2, SO2 : $so2, O3 : $o3'),
//             TextButton(
//               onPressed: () {
//                 print('enter');
//                 _selectDate(context);
//                 print('Printy AQI : $aqi, PM10 : $pm10, NO2 : $no2, SO2 : $so2, O3 : $o3');
//               },
//               child: Text('Choose Date',textScaleFactor: 1,style: TextStyle(fontWeight:FontWeight.bold),),
//             ),

//             Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text((selectedDate == null) ? 'Picke date!!' : dateFormate.format(selectedDate),textScaleFactor: 1.5,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),
//           ),

//               // Row(
//                 //  mainAxisAlignment: MainAxisAlignment.center,
//                 //  children: <Widget>[
//                   //  child: Text("AQI  : $aqi",textScaleFactor: 1.5),
//                   //  child: Text("PM10 : $pm10",textScaleFactor: 1.5),
//                   //  child: Text("NO2  : $no2",textScaleFactor: 1.5),
//                   //  child: Text("SO2  : $so2",textScaleFactor: 1.5),
//                   //  child: Text("O3   : $o3",textScaleFactor: 1.5),
//           Padding(
//             padding: const EdgeInsets.all(25.0),
//           child : Center(
//             child: Table(

//             // border:TableBorder.all(width: 1.0,color: Colors.white),
//             children: [
//               TableRow(
//                 children: [
//                   Center(child:Text("AQI  $aqi",textScaleFactor: 1.5,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),)
//                   // Text("$aqi",textScaleFactor: 1.5),
//                 ]
//               ),
//                TableRow(
//                 children: [
//                   Center(child : Text("PM10 $pm10",textScaleFactor: 1.5,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),)
//                   // Text("$pm10",textScaleFactor: 1.5),
//                 ]
//               ),
//               TableRow(
//                 children: [
//                   Center(child:Text("NO2  $no2",textScaleFactor: 1.5,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),)
//                   // Text("$no2",textScaleFactor: 1.5),
//                 ]
//               ),
//               TableRow(
//                 children: [
//                   Center(child: Text("SO2  $so2",textScaleFactor: 1.5,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),)
//                   // Text("$so2",textScaleFactor: 1.5),
//                 ]
//               ),
//               TableRow(
//                 children: [
//                   Center(child:Text("O3   $o3",textScaleFactor: 1.5,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),),)
//                   // Text("$o3",textScaleFactor: 1.5),
//                 ]
//               ),
//             ],
//         ),
//           ),

//                 //  ],
//                ),
//             //  ),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //Initialize the chart widget
//            SfCartesianChart(
//               primaryXAxis: CategoryAxis(),
//               // Chart title
//               title: ChartTitle(text: 'Last 30 Days Pollutants Graph',backgroundColor: Colors.white,),
//               // Enable legend
//               legend: Legend(isVisible: true),
//               // Enable tooltip
//               tooltipBehavior: TooltipBehavior(enable: true),
//               series: <ChartSeries<_SaData, String>>[
//                 LineSeries<_SaData, String>(
//                     dataSource: csdata,
//                     xValueMapper: (_SaData sas, _) => sas.year,
//                     yValueMapper: (_SaData sas, _) => sas.sas,
//                     name: 'AQI',
//                     // Enable data label
//                     dataLabelSettings: DataLabelSettings(isVisible: true)),
//                 LineSeries<_SaData, String>(
//                     dataSource: csdata2,
//                     xValueMapper: (_SaData sas, _) => sas.year,
//                     yValueMapper: (_SaData sas, _) => sas.sas,
//                     name: 'PM10',
//                     // Enable data label
//                     dataLabelSettings: DataLabelSettings(isVisible: false)),
//                 // LineSeries<_SaData, String>(
//                 //     dataSource: csdata3,
//                 //     xValueMapper: (_SaData sas, _) => sas.year,
//                 //     yValueMapper: (_SaData sas, _) => sas.sas,
//                 //     name: 'SO2',
//                 //     // Enable data label
//                 //     dataLabelSettings: DataLabelSettings(isVisible: false)),
//                 // LineSeries<_SaData, String>(
//                 //     dataSource: csdata4,
//                 //     xValueMapper: (_SaData sas, _) => sas.year,
//                 //     yValueMapper: (_SaData sas, _) => sas.sas,
//                 //     name: 'O3',
//                     // Enable data label
//                     // dataLabelSettings: DataLabelSettings(isVisible: false))
//               ])
//           // )
//         ]))
//       );
//   }
// }
  

// ****************old**********************
// class MyAppNew extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LineChartSample1(),
//     );
//   }
// }

/*class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Chartdata {
  String year = '';
  var aqidata = null;
  Chartdata(this.year,this.aqidata);
}  

class _MyAppState extends State<MyApp> {
  DateTime date = DateTime.now();
  final dateFormate = DateFormat('yyyy-MM-dd');
  var aqi = null;
  var pm10 = null;
  var no2 = null;
  var so2 = null;
  var o3 = null;
  getApiData(String s) async{
    print('Yaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaayyyyyyy');
    String url = 'http://vc8006.pythonanywhere.com/api/?Date=$s';
    // String url = 'http://vc8006.pythonanywhere.com/api/';
    http.Response respons = await http.get(Uri.parse(url));
    String val = respons.body;
    List<dynamic> data = jsonDecode(val);
    if(respons.statusCode == 200){
      print('sucess');
      print(data);
      setState(() {
        aqi = data[0]['AQI'];
        pm10 = data[0]['PM10'];
        no2 = data[0]['NO2'];
        so2 = data[0]['SO2'];
        o3 = data[0]['O3'];
      });
      // Text('inside on getdataapi wale me AQI : $aqi, PM10 : $pm10, NO2 : $no2, SO2 : $so2, O3 : $o3');
    }else{
      print('oops.............!!!');
    }
  }
  
  List<String> a = [];
  List<int> aq =[];
  List<int> pm =[];
  List<int> no =[];
  List<int> so =[];
  List<int> o =[];

  getApiChart() async{
    print('Yaaaaaaaaa from chartwale');
    String url = 'http://vc8006.pythonanywhere.com/api/';
    http.Response respons = await http.get(Uri.parse(url));
    String val = respons.body;
    List<dynamic> chartData = jsonDecode(val);
    if(respons.statusCode == 200){
      print('sucess');
      print(chartData[chartData.length-1]);

      for(var i = 1;i<=30;i++)
      {
        // await Future.delayed(const Duration(seconds : 1),(){
        setState(() {
          a.add(chartData[chartData.length-i]['Date']);
          pm.add(chartData[chartData.length-i]['PM10']);
          no.add(chartData[chartData.length-i]['NO2']);
          so.add(chartData[chartData.length-i]['SO2']);
          o.add(chartData[chartData.length-i]['O3']);
          aq.add(chartData[chartData.length-i]['AQI']);
        });
        // });
        // print(chartData[chartData.length-i]);
      }

      print(a);
      print('dates done');
      print(aq);
      print('aqi done');
      print(pm);
      print('pm done');
      print(no);
      print('no done');
      print(so);
      print('so done');
      print(o);
      print('o done');
     
  }
}
  @override
  void initState() {
  super.initState();
  getApiChart();
  }



  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime.now().add(Duration(days: 7)));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      }
      );
      print(dateFormate.format(picked!));
      // getApiChart();
      getApiData(dateFormate.format(picked));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text((selectedDate == null) ? 'Picke date!!' : dateFormate.format(selectedDate)),
            Text((aqi == null) ? 'for data!' : 'AQI : $aqi, PM10 : $pm10, NO2 : $no2, SO2 : $so2, O3 : $o3'),
            TextButton(
              onPressed: () {
                print('enter');
                _selectDate(context);
                print('Printy AQI : $aqi, PM10 : $pm10, NO2 : $no2, SO2 : $so2, O3 : $o3');
              },
              child: Text('Choose Date'),
            ),
          ],
        ),
      ),
    );
  }
}
*/
