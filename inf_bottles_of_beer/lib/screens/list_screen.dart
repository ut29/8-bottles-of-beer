import 'package:flutter/material.dart';
import 'package:inf_bottles_of_beer/models/beer.dart';
import 'detailed_screen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
      body: _buildList(),
    );
  }

  Widget _buildList() {
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
      trailing: _buildRating(beer),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailedScreen(beer);
        })).then((value) {
          setState(() {
            _buildRow(beer);
          });
        });
      },
    );
  }

  Widget _buildRating(Beer beer) {
    return Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothStarRating(
                allowHalfRating: false,
                starCount: 5,
                rating: beer.rating ?? 0,
                size: 20.0,
                isReadOnly: true,
                halfFilledIconData: Icons.star_half,
                filledIconData: Icons.star,
                spacing: 0.0),
            Text(
              beer.rating != null ? beer.rating.toString() : '-',
              style: _smallerFont,
            )
          ],
        ));
  }
}
