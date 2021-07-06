import 'package:flutter/material.dart';
import '../models/beer.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';

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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime selected = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 1),
    ))!;
    setState(() {
      _beer.date = selected;
    });
  }

  Widget _buildBasicSection(Beer beer) {
    initializeDateFormatting("ja_JP");
    var formatter = new DateFormat('yyyy/MM/dd', "ja_JP");
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              const Text('BEER NAME  '),
              Expanded(
                child: TextField(
                  controller: TextEditingController(text: beer.name),
                  onChanged: (text) {
                    beer.name = text;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('BREWER  '),
              Expanded(
                child: TextField(
                  controller: TextEditingController(text: beer.brewer),
                  onChanged: (text) {
                    beer.brewer = text;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('ORIGIN  '),
              Expanded(
                child: TextField(
                  controller: TextEditingController(text: beer.origin),
                  onChanged: (text) {
                    beer.origin = text;
                  },
                ),
              ),
              const Text('    DATE '),
              Expanded(
                child: TextField(
                  controller:
                      TextEditingController(text: formatter.format(beer.date)),
                  onTap: () => _selectDate(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _beer = widget._beer;

    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(
        children: [
          //_buildPhotoSection(_beer),
          _buildBasicSection(_beer),
          //detailSection(_beer),
        ],
      ),
    );
  }
}
