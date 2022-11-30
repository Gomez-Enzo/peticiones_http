import 'package:http/http.dart' as http;
import 'package:peticiones_http/client/response.dart';

void main(List<String> arguments) {
  final url = Uri.parse('https://restcountries.com/v3.1/name/col');
  http.get(url).then(
    (res) {
      final respuesta = responseFromJson(res.body);
      print('====================================');
      print('Pais: ${respuesta}');
    },
  ).catchError((error) => print(error));
}
