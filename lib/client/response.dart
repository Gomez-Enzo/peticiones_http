import 'dart:convert';

List<Response> responseFromJson(String str) =>
    List<Response>.from(json.decode(str).map((x) => Response.fromJson(x)));

String responseToJson(List<Response> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Response {
  Response({
    required this.name,
    required this.currencies,
    required this.languages,
    required this.latlng,
    required this.borders,
    required this.population,
    required this.flags,
  });

  Name name;
  Currencies currencies;
  Languages languages;
  List<double> latlng;
  List<String> borders;
  int population;
  Flags flags;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        name: Name.fromJson(json["name"]),
        currencies: Currencies.fromJson(json["currencies"]),
        languages: Languages.fromJson(json["languages"]),
        latlng: List<double>.from(json["latlng"].map((x) => x)),
        borders: List<String>.from(json["borders"].map((x) => x)),
        population: json["population"],
        flags: Flags.fromJson(json["flags"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "currencies": currencies.toJson(),
        "languages": languages.toJson(),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "population": population,
        "flags": flags.toJson(),
      };
}

class Currencies {
  Currencies({
    this.cop,
  });

  Cop? cop;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        cop: json["COP"] == null ? null : Cop.fromJson(json["COP"]),
      );

  Map<String, dynamic> toJson() => {
        "COP": cop!.toJson(),
      };
}

class Cop {
  Cop({
    required this.name,
    required this.symbol,
  });

  String name;
  String symbol;

  factory Cop.fromJson(Map<String, dynamic> json) => Cop(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Flags {
  Flags({
    required this.png,
    required this.svg,
  });

  String png;
  String svg;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

class Languages {
  Languages({
    this.spa,
  });

  String? spa;

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        spa: json["spa"] == null ? null : json["spa"],
      );

  Map<String, dynamic> toJson() => {
        "spa": spa,
      };
}

class Name {
  Name({
    required this.common,
    required this.official,
  });

  String common;
  String official;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
      };
}
