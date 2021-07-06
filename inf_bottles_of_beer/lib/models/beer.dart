enum Currency {
  none,
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
  double alcohol = 0;
  double darkFruit = 0;
  double citrusFruit = 0;
  double hoppy = 0;
  double floral = 0;
  double spicy = 0;
  double herbal = 0;
  double malty = 0;
  double toffee = 0;
  double burnt = 0;
  double sweet = 0;
  double sour = 0;
  double bitter = 0;
  double dry = 0;
  double body = 0;
  double linger = 0;
}

class Beer {
  String name;
  String? brewer;
  double? price;
  Currency? unit;
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

  Beer(this.name, [this.brewer, this.abv, this.ibu, this.srm]);
}
