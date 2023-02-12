import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_application/utils/api_http.dart';

import '../model/homemodel.dart';
import '../provider/homeprovier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? providertrue;
  HomeProvider? providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Stack(
          children: [
            FutureBuilder(
              future: Api_http().weatherdata(providertrue!.city == null
                  ? "Surat"
                  : "${providertrue!.city}"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                if (snapshot.hasData) {
                  Homemodel? h1 = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: providertrue!.txtcity,
                            cursorColor: Colors.white70,
                            style: TextStyle(color: Colors.white70),
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  providertrue!.search();
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white70,
                                ),
                              ),
                              hintText: "Serch City",
                              hintStyle: TextStyle(color: Colors.white70),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white70),
                                  borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white70),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Stack(
                          children: [
                            Center(
                              child: Text(
                                "${h1!.name}",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${(h1.main!.temp! - 273).toStringAsFixed(0)}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 90,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 72),
                                  child: Text(
                                    ".",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 75),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 11),
                                  child: Text(
                                    "c",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 150),
                                child: Text(
                                  "${h1.weather![0].description}",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 185),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${DateTime.now().weekday == 1 ? "Monday" : ""}${DateTime.now().weekday == 2 ? "Tuesday" : ""}${DateTime.now().weekday == 3 ? "Wednesday" : ""}${DateTime.now().weekday == 4 ? "Thursday" : ""}${DateTime.now().weekday == 5 ? "Friday" : ""}${DateTime.now().weekday == 6 ? "Saturday" : ""}${DateTime.now().weekday == 7 ? "Sunday" : ""} ,${DateTime.now().day} ${DateTime.now().month == 1 ? "Jan" : ""}${DateTime.now().month == 2 ? "Feb" : ""}${DateTime.now().month == 3 ? "Mar" : ""}${DateTime.now().month == 4 ? "Apr" : ""}${DateTime.now().month == 4 ? "May" : ""}${DateTime.now().month == 6 ? "Jun" : ""}${DateTime.now().month == 7 ? "July" : ""}${DateTime.now().month == 8 ? "Aug" : ""}${DateTime.now().month == 9 ? "Sep" : ""}${DateTime.now().month == 10 ? "Oct" : ""}${DateTime.now().month == 11 ? "Nov" : ""}${DateTime.now().month == 12 ? "Dec" : ""} ",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 80),
                        Container(
                            height: 0.7,
                            width: double.infinity,
                            color: Colors.white70),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Icon(Icons.air, color: Colors.white70),
                                    SizedBox(height: 5),
                                    Text(
                                      "${(h1.wind!.speed)!.toStringAsFixed(1)} km/h",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Wind",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Icon(Icons.water_drop_rounded,
                                        color: Colors.white70),
                                    SizedBox(height: 5),
                                    Text(
                                      "${(h1.main!.humidity)!.toStringAsFixed(0)}%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Humidity",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Icon(Icons.cloud_queue_rounded,
                                        color: Colors.white70),
                                    SizedBox(height: 5),
                                    Text(
                                      "${(100 - h1.clouds!.all!).toStringAsFixed(0)}%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Chance of rain",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Visibility - ${h1.visibility}m",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w400,
                              fontSize: 25),
                        ),
                        SizedBox(height: 15),
                        Container(
                            height: 0.7,
                            width: double.infinity,
                            color: Colors.white70),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
