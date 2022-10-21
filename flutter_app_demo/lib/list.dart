import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "List_Page",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              const Text("list_page"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'gitlist');
                },
                child: const Text("Show some page"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
