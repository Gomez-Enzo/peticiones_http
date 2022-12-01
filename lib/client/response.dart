import 'dart:convert';

import 'class/class.dart';

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
  List<String>? borders;
  int population;
  Flags flags;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        name: Name.fromJson(json["name"]),
        currencies: Currencies.fromJson(json["currencies"]),
        languages: Languages.fromJson(json["languages"]),
        latlng: List<double>.from(json["latlng"].map((x) => x)),
        borders: json["borders"] == null
            ? null
            : List<String>.from(json["borders"].map((x) => x)),
        population: json["population"],
        flags: Flags.fromJson(json["flags"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "currencies": currencies.toJson(),
        "languages": languages.toJson(),
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "borders":
            borders == null ? null : List<dynamic>.from(borders!.map((x) => x)),
        "population": population,
        "flags": flags.toJson(),
      };
}
