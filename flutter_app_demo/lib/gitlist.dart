import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FutureBuilderRoute extends StatefulWidget {
  const FutureBuilderRoute({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FutureBuilderRouteState();
  }
}

class _FutureBuilderRouteState extends State<FutureBuilderRoute> {
  final Dio _dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
            future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //request success
              if (snapshot.connectionState == ConnectionState.done) {
                Response response = snapshot.data;
                //error
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                // ignore: avoid_print
                print(response.data);
                //After request success do...
                return ListView(
                  children: response.data.map<Widget>((item) {
                    // ignore: prefer_const_constructors
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.cyan),
                          child: SizedBox(
                              height: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // ignore: prefer_const_constructors
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Tips"),
                                              content: Text(item["full_name"]),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop('ok');
                                                    },
                                                    child:
                                                        const Text("confirm"))
                                              ],
                                            );
                                          });
                                    },
                                    child: Text(
                                      item["full_name"],
                                      style: const TextStyle(
                                          backgroundColor: Colors.cyan,
                                          fontSize: 19,
                                          color: Colors.white),
                                    ),
                                  )
                                ],
                              ))),
                    );
                  }).toList(),
                );
              }
              //loading
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
