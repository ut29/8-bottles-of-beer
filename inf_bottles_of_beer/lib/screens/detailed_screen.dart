import 'package:flutter/material.dart';
import '../models/beer.dart';

class DetailedScreen extends StatefulWidget {
  //const DetailedScreen({Key? key}) : super(key: key);
  final Beer _beer;
  // ignore: use_key_in_widget_constructors
  const DetailedScreen(this._beer);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  late Beer _beer;

  @override
  Widget build(BuildContext context) {
    _beer = widget._beer;
    return Scaffold(
      appBar: AppBar(
        title: Text(_beer.name),
      ),
    );
  }
}
