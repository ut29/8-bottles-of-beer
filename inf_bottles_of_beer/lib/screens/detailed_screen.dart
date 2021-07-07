import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/beer.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';
import 'dart:async';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
  final _denseDecoration = const InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.all(2),
  );

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
                  decoration: _denseDecoration,
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
                  decoration: _denseDecoration,
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
                  decoration: _denseDecoration,
                  controller: TextEditingController(text: beer.origin),
                  onChanged: (text) {
                    beer.origin = text;
                  },
                ),
              ),
              const Text('  DATE '),
              Expanded(
                child: TextField(
                  decoration: _denseDecoration,
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

  Widget _buildDetailSection(Beer beer) {
    return Container(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 3,
          child: _buildDetailLeft(beer),
        ),
        Expanded(
          flex: 5,
          child: _buildDetailRight(beer),
        ),
      ]),
    );
  }

  Widget _buildDetailLeft(Beer beer) {
    return Container(
      child: Column(
        children: [
          _buildBorderSection('RATING', _buildRating(beer)),
          _buildBorderSection('STATS', _buildStats(beer)),
          _buildBorderSection('SERVING TYPE', _buildServingType(beer)),
          _buildBorderSection('BUBBLE METER', Text('TBD')),
        ],
      ),
    );
  }

  Widget _buildDetailRight(Beer beer) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildBorderSection('NOTES', _buildNotes(beer)),
          _buildBorderSection('FLAVOR WHEEL', Text('TBD')),
        ],
      ),
    );
  }

  Widget _buildStats(Beer beer) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              const Text('AVB  '),
              Expanded(
                child: TextField(
                  decoration: _denseDecoration,
                  //keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: TextEditingController(
                      text: beer.abv != null ? beer.abv.toString() : ''),
                  onChanged: (text) {
                    beer.abv = double.parse(text);
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('IBU  '),
              Expanded(
                child: TextField(
                  decoration: _denseDecoration,
                  //keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: TextEditingController(
                      text: beer.ibu != null ? beer.ibu.toString() : ''),
                  onChanged: (text) {
                    beer.ibu = double.parse(text);
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('OG  '),
              Expanded(
                child: TextField(
                  decoration: _denseDecoration,
                  //keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: TextEditingController(
                      text: beer.og != null ? beer.og.toString() : ''),
                  onChanged: (text) {
                    beer.og = double.parse(text);
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('TG  '),
              Expanded(
                child: TextField(
                  decoration: _denseDecoration,
                  //keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: TextEditingController(
                      text: beer.tg != null ? beer.tg.toString() : ''),
                  onChanged: (text) {
                    beer.tg = double.parse(text);
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('SRM  '),
              Expanded(
                child: TextField(
                  decoration: _denseDecoration,
                  //keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: TextEditingController(
                      text: beer.srm != null ? beer.srm.toString() : ''),
                  onChanged: (text) {
                    beer.srm = int.parse(text);
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text('PRICE  '),
              Expanded(
                child: TextField(
                  decoration: _denseDecoration,
                  //keyboardType: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: TextEditingController(
                      text: beer.price != null ? beer.price.toString() : ''),
                  onChanged: (text) {
                    beer.price = double.parse(text);
                  },
                ),
              ),
              Text(beer.unit.toString().split('.').last),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServingType(Beer beer) {
    return Container(
      child: Column(
        children: [
          RadioListTile(
            contentPadding: EdgeInsets.all(0),
            dense: true,
              title: Text('BOTTLE'),
              value: ServingType.bottle,
              groupValue: beer.servingType,
              onChanged: (value) {
                setState(() {
                  beer.servingType = value as ServingType;
                });
              }),
          RadioListTile(
            contentPadding: EdgeInsets.all(0),
            dense: true,
              title: Text('CAN'),
              value: ServingType.can,
              groupValue: beer.servingType,
              onChanged: (value) {
                setState(() {
                  beer.servingType = value as ServingType;
                });
              }),
          RadioListTile(
            contentPadding: EdgeInsets.all(0),
            dense: true,
              title: Text('CASK'),
              value: ServingType.cask,
              groupValue: beer.servingType,
              onChanged: (value) {
                setState(() {
                  beer.servingType = value as ServingType;
                });
              }),
          RadioListTile(
            contentPadding: EdgeInsets.all(0),
            dense: true,
              title: Text('DRAFT'),
              value: ServingType.draft,
              groupValue: beer.servingType,
              onChanged: (value) {
                setState(() {
                  beer.servingType = value as ServingType;
                });
              }),
          RadioListTile(
            contentPadding: EdgeInsets.all(0),
            dense: true,
              title: Text('GROWLER'),
              value: ServingType.growler,
              groupValue: beer.servingType,
              onChanged: (value) {
                setState(() {
                  beer.servingType = value as ServingType;
                });
              }),
        ],
      ),
    );
  }

  Widget _buildNotes(Beer beer) {
    return TextField(
      decoration: _denseDecoration,
      controller: TextEditingController(text: beer.notes),
      onChanged: (text) {
        beer.notes = text;
      },
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      minLines: 5,
      textInputAction: TextInputAction.done,
    );
  }

  Widget _buildStar(double value) {
    return SmoothStarRating(
        allowHalfRating: false,
        onRated: (v) {},
        starCount: 5,
        rating: value,
        size: 20.0,
        isReadOnly: true,
        halfFilledIconData: Icons.star_half,
        filledIconData: Icons.star,
        spacing: 0.0);
  }

  Widget _buildRating(Beer beer) {
    return Container(
        //padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStar(beer.rating ?? 0),
        Visibility(
          visible: true,
          child: Slider(
            value: beer.rating ?? 0,
            min: 0,
            max: 5,
            divisions: 20,
            onChanged: (double value) {
              setState(() {
                beer.rating = value;
                _buildStar(beer.rating ?? 0);
              });
            },
          ),
        ),
      ],
    ));
  }

  Widget _buildBorderBox(Widget contents) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(
        width: 2,
        color: Colors.black26,
      )),
      child: contents,
    );
  }

  Widget _buildBorderSection(String title, Widget contents) {
    return _buildBorderBox(Column(
      children: [
        Text(title),
        Divider(
          height: 3,
          thickness: 2,
          color: Colors.black26,
        ),
        contents,
      ],
    ));
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
          _buildDetailSection(_beer),
        ],
      ),
    );
  }
}
