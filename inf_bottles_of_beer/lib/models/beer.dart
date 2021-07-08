enum Currency {
  jpy,
  usd,
  eur,
}

enum ServingType {
  none,
  draft,
  bottle,
  can,
  cask,
  growler,
}

enum BubbleMeter {
  none,
  high,
  sparkling,
  medium,
  still,
}

class Flavor {
  int alcohol = 0;
  int darkFruit = 0;
  int citrusFruit = 0;
  int hoppy = 0;
  int floral = 0;
  int spicy = 0;
  int herbal = 0;
  int malty = 0;
  int toffee = 0;
  int burnt = 0;
  int sweet = 0;
  int sour = 0;
  int bitter = 0;
  int dry = 0;
  int body = 0;
  int linger = 0;
}

class Beer {
  String name;
  String? brewer;
  String? origin;
  DateTime date = DateTime.now();
  double? price;
  late Currency unit;
  String? sampled;
  double? rating;
  String? notes;
  double? ibu;
  double? abv;
  double? og;
  double? tg;
  int? srm;
  ServingType? servingType;
  BubbleMeter? bubbleMeter;
  Flavor flavor = Flavor();

  Beer(this.name, [this.brewer, this.abv, this.ibu, this.srm]) {
    unit = Currency.usd;  // should be default
  }
}
