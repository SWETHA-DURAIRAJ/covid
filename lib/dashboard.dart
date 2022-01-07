import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Covid> fetchData() async {
  final response = await http
      .get('https://corona.lmao.ninja/v2/countries/india?yesterday=false');
  if (response.statusCode == 200) {
    return Covid.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to Load\nTry Again");
  }
}

class Covid {
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final int updated;

  Covid(
      {this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.updated});
  factory Covid.fromJson(Map<String, dynamic> jsno) {
    return Covid(
      cases: jsno['cases'],
      todayCases: jsno['todayCases'],
      deaths: jsno['deaths'],
      todayDeaths: jsno['todayDeaths'],
      recovered: jsno['recovered'],
      todayRecovered: jsno['todayRecovered'],
      active: jsno['active'],
      critical: jsno['critical'],
      updated: jsno['updated'],
    );
  }
}

class DashBorad extends StatefulWidget {
  @override
  _DashBoradState createState() => _DashBoradState();
}

class _DashBoradState extends State<DashBorad> {
  Future<Covid> futureCovid;
  @override
  void initState() {
    futureCovid = fetchData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Covid>(
        future: futureCovid,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/covid1.jpg"),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.brown,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('CASES : ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontStyle: FontStyle.italic)),
                          Text(snapshot.data.cases.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.brown,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('TODAYCASES: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontStyle: FontStyle.italic)),
                          Text(snapshot.data.todayCases.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('DEATHS : ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontStyle: FontStyle.italic)),
                          Text(snapshot.data.deaths.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('TODAYDEATHS: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontStyle: FontStyle.italic)),
                          Text(snapshot.data.todayDeaths.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.greenAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('RECOVERED: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontStyle: FontStyle.italic)),
                          Text(snapshot.data.recovered.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.greenAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('TODAYRECOVERED: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontStyle: FontStyle.italic)),
                          Text(snapshot.data.todayRecovered.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.deepOrange,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('ACTIVE: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontStyle: FontStyle.italic)),
                          Text(snapshot.data.active.toString(),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black87)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.blueAccent,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('CRITICAL: ',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.amber,
                                  fontStyle: FontStyle.italic)),
                          Text(snapshot.data.critical.toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
