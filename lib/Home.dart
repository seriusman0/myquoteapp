import 'package:flutter/material.dart';

import 'Quote.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Quote> quotesList = <Quote>[];
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quotesList
        .add(Quote(quote: 'Belajar adalah investasi waktu', author: 'Serius'));
    quotesList
        .add(Quote(quote: 'Mengurangi Pekerjaan sekarang', author: 'Serius'));
    quotesList
        .add(Quote(quote: 'Jangan Suka menunda pekerjaan', author: 'Serius'));
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          'Quotes Generator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                image: DecorationImage(
                  image: AssetImage('assets/author.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(quotesList[index].getQuote(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                )),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                quotesList[index].getAuthor(),
                style: TextStyle(color: Colors.white),
              )),
          RaisedButton(
            color: Colors.grey,
            child: Text(
              'Show next Quotes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              setState(() {
                index = (index + 1) % quotesList.length;
              });
              print(quotesList[index].getQuote());
              print(quotesList[index].getAuthor());
              // index = (index + 1) % quotesList.length;
            },
          ),
        ],
      )),
    );
  }
}
