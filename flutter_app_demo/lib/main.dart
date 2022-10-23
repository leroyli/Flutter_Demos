// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'list.dart';
import 'gitlist.dart';
import 'book_page.dart';
import 'me_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          "gitlist": (context) => const FutureBuilderRoute(),
          "list": (context) => ListPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var pages = [ListPage(), BookPage(), MePage()];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.pink,
                icon: Icon(Icons.home),
                label: "list"),
            BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(Icons.list),
                label: "book"),
            BottomNavigationBarItem(
                backgroundColor: Colors.orange,
                icon: Icon(Icons.person),
                label: "me"),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Navigator.pushNamed(context, 'gitlist')),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
