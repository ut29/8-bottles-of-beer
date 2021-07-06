import 'package:flutter/material.dart';
import '../models/beer.dart';
import './detailed_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

// test
var beers = [
  Beer('Super Dry', 'Asahi'),
  Beer('Ichiban Shibori', 'Kirin'),
  Beer('Premium Malts', 'Suntory'),
  Beer('Yona Yona Ale', 'Yoho'),
  Beer('Indo no Aooni', 'Yoho'),
  Beer('Corona Beer', 'Corona'),
  Beer('Heineken', 'Heineken'),
  Beer('Super Dry', 'Asahi'),
  Beer('Ichiban Shibori', 'Kirin'),
  Beer('Premium Malts', 'Suntory'),
  Beer('Yona Yona Ale', 'Yoho'),
  Beer('Indo no Aooni', 'Yoho'),
  Beer('Corona Beer', 'Corona'),
  Beer('Heineken', 'Heineken'),
  Beer('Super Dry', 'Asahi'),
  Beer('Ichiban Shibori', 'Kirin'),
  Beer('Premium Malts', 'Suntory'),
  Beer('Yona Yona Ale', 'Yoho'),
  Beer('Indo no Aooni', 'Yoho'),
  Beer('Corona Beer', 'Corona'),
  Beer('Heineken', 'Heineken'),
  Beer('Super Dry', 'Asahi'),
  Beer('Ichiban Shibori', 'Kirin'),
  Beer('Premium Malts', 'Suntory'),
  Beer('Yona Yona Ale', 'Yoho'),
  Beer('Indo no Aooni', 'Yoho'),
  Beer('Corona Beer', 'Corona'),
  Beer('Heineken', 'Heineken'),
  Beer('Super Dry', 'Asahi'),
  Beer('Ichiban Shibori', 'Kirin'),
  Beer('Premium Malts', 'Suntory'),
  Beer('Yona Yona Ale', 'Yoho'),
  Beer('Indo no Aooni', 'Yoho'),
  Beer('Corona Beer', 'Corona'),
  Beer('Heineken', 'Heineken'),
  Beer('Super Dry', 'Asahi'),
  Beer('Ichiban Shibori', 'Kirin'),
  Beer('Premium Malts', 'Suntory'),
  Beer('Yona Yona Ale', 'Yoho'),
  Beer('Indo no Aooni', 'Yoho'),
  Beer('Corona Beer', 'Corona'),
  Beer('Heineken', 'Heineken'),
];

class _ListScreenState extends State<ListScreen> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _smallerFont = const TextStyle(fontSize: 12.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inf. bottles of beer'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        return _buildRow(beers[index]);
      },
      itemCount: beers.length,
    );
  }

  Widget _buildRow(Beer beer) {
    return ListTile(
      title: Text(
        beer.name,
        style: _biggerFont,
      ),
      subtitle: Text(beer.brewer ?? '', style: _smallerFont),
      trailing: RatingBar.builder(
        initialRating: beer.rating ?? 0,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemSize: 20,
        itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          beer.rating = rating;
        },
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailedScreen(beer);
        })).then((value) {
          return _buildSuggestions();
        });
      },
    );
  }
}
