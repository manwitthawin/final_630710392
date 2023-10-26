import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:final_630710392/models/todo_item.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final _dio = Dio(BaseOptions(responseType: ResponseType.plain));
  List<TodoItem>? _itemList;
  String? _error;

  void getTodos() async {
    try {
      setState(() {
        _error = null;
      });

      // await Future.delayed(const Duration(seconds: 3), () {});

      final response =
      await _dio.get('https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=Nakhon%20Pathom');
      debugPrint(response.data.toString());
      // parse
      List list = jsonDecode(response.data.toString());
      setState(() {
        _itemList = list.map((item) => TodoItem.fromJson(item)).toList();
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
      debugPrint('เกิดข้อผิดพลาด: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(216, 240, 246, 1.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(5.0),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Bangkok",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      ),
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(5.0),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Nakhon Pathom",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      ),
                    )
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(5.0),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Paris",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                      ),
                    )
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Nakhon Pathom",style: TextStyle(
                fontSize: 40,
              ),
              ),
            ),
            Text("Thailand",style: TextStyle(
              fontSize: 20,

            ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text("2023-10-26 10:15",style: TextStyle(
                fontSize: 15,
                color: Colors.grey
              ),
              ),
            ),
            Image.asset(
              'assets/images/cloudy.png',
              width: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Text("Patchy rain possible",style: TextStyle(
                fontSize: 20
              ),
              ),
            ),
            Column(
              children: [
                Text("28.8",style: TextStyle(
                  fontSize: 60
                ),
                ),
                Text("Feels like 36.6",style: TextStyle(
                    fontSize: 20
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("°C",style: TextStyle(
                        fontSize: 30
                      ),
                      ),
                      Image.asset(
                        'assets/images/line.png',
                        width: 20,
                        color: Colors.black38,
                      ),
                      Text("°F",style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey
                      ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/waterdrop.png',
                      width: 20,
                      color: Colors.black38,
                    ),
                    Text("HUMUDITY",style: TextStyle(
                        fontSize: 15,
                        color: Colors.black38
                    ),
                    ),
                    Text("76%",style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/line.png',
                  width: 20,
                  color: Colors.black38,
                ),
                Column(
                  children: [
                    Image.asset(
                        'assets/images/wind.png',
                      width: 20,
                      color: Colors.black38,
                    ),
                    Text("WIND",style: TextStyle(
                        fontSize: 15,
                        color: Colors.black38
                    ),
                    ),
                    Text("7.6 km/h",style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/line.png',
                  width: 20,
                  color: Colors.black38,
                ),
                Column(
                  children: [
                    Image.asset(
                        'assets/images/sun.png',
                      width: 20,
                      color: Colors.black38,
                    ),
                    Text("UV",style: TextStyle(
                        fontSize: 15,
                        color: Colors.black38
                    ),
                    ),
                    Text("6",style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
