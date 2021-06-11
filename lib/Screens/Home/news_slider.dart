import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_ui/Screens/Home/news_detailspage.dart';
// import 'package:login_ui/Screens/details.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  List data;
  // @override
  // void initState() {
  //   super.initState();
  //   fetch_data_from_api();
  // }

  // ignore: non_constant_identifier_names
  Future<String> fetch_data_from_api() async {
    var jsondata = await http.get(
        "http://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=d572706e707449d1ba4e5c179f5104de");
    var fetchdata = jsonDecode(jsondata.body);
    data == null ? Container() : Text("data");
    print('Start');
    print(fetchdata);

    print('end');
    setState(() {
      data = fetchdata["articles"];
    });
    return "Success";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch_data_from_api();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 310,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                author: data[index]["author"],
                                title: data[index]["title"],
                                description: data[index]["description"],
                                urlToImage: data[index]["urlToImage"],
                                publishedAt: data[index]["publishedAt"],
                              )));
                },
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                        child: Image.network(
                          data[index]["urlToImage"],
                          fit: BoxFit.cover,
                          height: 400.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(50.0, 300.0, 0.0, 0.0),
                      child: Container(
                        height: 60.0,
                        width: 300.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          elevation: 10.0,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 15.0, 5.0, 5.0),
                                  child: Text(
                                    data[index]["title"],
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: data == null ? 0 : data.length,
            autoplay: true,
            viewportFraction: 0.8,
            scale: 0.9,
          ),
        ),
      ),
    );
  }
}
