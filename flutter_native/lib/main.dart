import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var channel = MethodChannel('leroy');
  var _data;
  var _naviteData;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    // the callback after receive native message
    channel.setMethodCallHandler((call) async {
      setState(() {
        _naviteData = call.arguments['count'];
      });
    });
  }

  Future<Null> jumpNativePage() async {
    final String result = await channel.invokeMethod('jump');
    print('the result is : $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () async {
                  var result = await channel
                      .invokeMethod('sendData', {'name': 'leroy', 'age': 20});
                  var name = result['name'];
                  var age = result['age'];
                  setState(() {
                    _data = '$name,$age';
                  });
                },
                child: const Text('send data to native')),
            Text('native response data, $_data'),
            Text('received native data: $_naviteData'),
            OutlinedButton(
                onPressed: () {
                  jumpNativePage();
                },
                child: Text('jump native page')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
