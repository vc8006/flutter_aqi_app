import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
void main() {
  runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AQI Prediction Delhi',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: Colors.white,
        // textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      // MaterialApp(
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<_SaData> csdata = [];
  List<_SaData> csdata2 = [];

  DateTime date = DateTime.now();
  final dateFormate = DateFormat('yyyy-MM-dd');
  var aqi = null;
  var pm10 = null;
  var no2 = null;
  var so2 = null;
  var o3 = null;

  get child => null;
  getApiData(String s) async {
    print('Yaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaayyyyyyy');
    String url = 'http://vc8006.pythonanywhere.com/api/?Date=$s';
    // String url = 'http://vc8006.pythonanywhere.com/api/';
    http.Response respons = await http.get(Uri.parse(url));
    String val = respons.body;
    List<dynamic> data = jsonDecode(val);
    if (respons.statusCode == 200) {
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
    } else {
      print('oops.............!!!');
    }
  }

  getApiChart() async {
    print('Yaaaaaaaaa from chartwale');
    String url = 'http://vc8006.pythonanywhere.com/api/';
    http.Response respons = await http.get(Uri.parse(url));
    String val = respons.body;
    List<dynamic> chartData = jsonDecode(val);
    if (respons.statusCode == 200) {
      print('sucess');
      print(chartData[chartData.length - 1]);

      for (var i = 1; i <= 30; i++) {
        // await Future.delayed(const Duration(seconds : 1),(){
        setState(() {
          csdata.add(_SaData(chartData[chartData.length - i]['Date'],
              chartData[chartData.length - i]['AQI']));
          csdata2.add(_SaData(chartData[chartData.length - i]['Date'],
              chartData[chartData.length - i]['PM10']));
        });
        // });
        // print(chartData[chartData.length-i]);
      }
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
      });
    print(dateFormate.format(picked!));
    // getApiChart();
    getApiData(dateFormate.format(picked));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AQI Prediction Delhi'),
      // ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
              alignment: Alignment.center,
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: Color(0xFFF2BEA1),
                shape: BoxShape.circle,
              ),
              // child: SvgPicture.asset("assets/icons/menu.svg"),
            ),
          ),
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              // color: Colors.lightBlueAccent,
              color: Color(0xFFF5CEB8),
              // image: DecorationImage(
              //   alignment: Alignment.centerLeft,
              //   image: AssetImage("Images/bg.jpg"),
              // ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: Text("AQI Pred Delhi",
                          textScaleFactor: 3,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54)),
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.5),
                    ),
                    child: TextButton(
                      onPressed: () {
                        print('enter');
                        _selectDate(context);
                        print(
                            'Printy AQI : $aqi, PM10 : $pm10, NO2 : $no2, SO2 : $so2, O3 : $o3');
                      },
                      child: Text(
                        'Choose Date',
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      (selectedDate == null)
                          ? 'Picke date!!'
                          : dateFormate.format(selectedDate),
                      textScaleFactor: 1.5,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),

                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      // childAspectRatio: .25,
                      // crossAxisSpacing: 3,
                      // mainAxisSpacing: 3,
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'AQI = $aqi',
                                      textScaleFactor: 1.5,
                                      style: TextStyle(fontWeight:FontWeight.bold,color: Colors.blue),
                                    ),
                                    Text('PM10 = $pm10',
                                        textScaleFactor: 1.5,
                                      style: TextStyle(fontWeight:FontWeight.bold,color: Colors.blue),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'NO2 = $no2',
                                      textScaleFactor: 1.5,
                                      style: TextStyle(fontWeight:FontWeight.bold,color: Colors.blue),
                                    ),
                                    Text('SO2 = $so2',
                                        textScaleFactor: 1.5,
                                      style: TextStyle(fontWeight:FontWeight.bold,color: Colors.blue),),
                                    Text('O3 = $o3',
                                        textScaleFactor: 1.5,
                                      style: TextStyle(fontWeight:FontWeight.bold,color: Colors.blue),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(
                        text: 'Last 30 Days AQI Graph',
                        backgroundColor: Colors.white,
                      ),
                      // Enable legend
                      // legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<_SaData, String>>[
                        LineSeries<_SaData, String>(
                            dataSource: csdata,
                            xValueMapper: (_SaData sas, _) => sas.year,
                            yValueMapper: (_SaData sas, _) => sas.sas,
                            name: 'AQI',
                            // Enable data label
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true)),
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SaData {
  _SaData(this.year, this.sas);

  final String year;
  final int sas;
}

 