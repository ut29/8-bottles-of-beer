import 'package:flutter/material.dart';
import 'package:inf_bottles_of_beer/models/beer.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class BeerRating extends StatefulWidget {
  Beer _beer;
  // ignore: use_key_in_widget_constructors
  BeerRating(this._beer);
  @override
  _BeerRatingState createState() => _BeerRatingState();
}

class _BeerRatingState extends State<BeerRating> {
  double _rating = 0;
  double _rating2 = 0;
  late SmoothStarRating _star;

  @override
  Widget build(BuildContext context) {
    _rating = widget._beer.rating ?? 0;
    _rating2 = _rating;
    _star = SmoothStarRating(
        allowHalfRating: true,
        starCount: 5,
        rating: _rating2,
        onRated: (v) {
          print('onrated');
          setState(() {
            _rating2 = v;
          });
        },
        size: 20.0,
        isReadOnly: true,
        halfFilledIconData: Icons.star_half,
        filledIconData: Icons.star,
        spacing: 0.0);

    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _star,
        Visibility(
          visible: true,
          child: Slider(
            value: _rating,
            min: 0,
            max: 5,
            divisions: 20,
            onChanged: (double value) {
              setState(() {
                _rating = value;
                widget._beer.rating = _rating;
                _star.onRated(value);
              });
            },
          ),
        ),
      ],
    ));
  }
}
