import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

// ignore: must_be_immutable
class ListPage extends StatelessWidget {
  ListPage({
    Key? key,
  }) : super(key: key);

  List<Map> imageList = [
    {"url": "http://www.itying.com/images/flutter/1.png"},
    {"url": "http://www.itying.com/images/flutter/2.png"},
    {"url": "http://www.itying.com/images/flutter/3.png"},
    {"url": "http://www.itying.com/images/flutter/4.png"}
  ];

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
              SizedBox(
                height: 200,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      imageList[index]["url"],
                      fit: BoxFit.fill,
                    );
                  },
                  itemCount: imageList.length,
                  autoplay: true,
                  pagination:
                      const SwiperPagination(alignment: Alignment.bottomCenter),
                ),
              ),
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
