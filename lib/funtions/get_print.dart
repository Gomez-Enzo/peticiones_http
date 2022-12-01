import 'package:http/http.dart' as http;
import '../client/response.dart';

void getResponseServise() {
  final url = Uri.parse('https://restcountries.com/v3.1/name/col');
  http.get(url).then(
    (res) {
      final response = responseFromJson(res.body);
      print('====================================');
      print('Pais: ${response[0].name.common}');
      print('Poblacion: ${response[0].population}');
      print('Fronteras: ${response[0].borders}');
      for (var f in response[0].borders!) {
        print('    $f');
      }
      print('Lenguaje: ${response[0].languages.spa}');
      print('Latitud: ${response[0].latlng.first}');
      print('Latitud: ${response[0].latlng.last}');
      print('Moneda: ${response[0].currencies.cop!.name}');
      print('Bandera: ${response[0].flags.svg}');
      print('====================================');
    },
  );
}
