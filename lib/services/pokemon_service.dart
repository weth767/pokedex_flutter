import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter/models/data.dart';
import 'package:pokedex_flutter/models/pokemon_data.dart';
import 'package:pokedex_flutter/models/response_data.dart';
import 'package:pokedex_flutter/utils/const.dart';

class PokemonService {
  Future<ResponseData> getAll([int limit = 10]) async {
    final response = await http.get(Uri.parse('$url/pokemon/?limit=$limit'));
    ResponseData responseData = ResponseData.fromMap(jsonDecode(response.body));
    for (Data element in responseData.results) {
      http.Response resp = await http.get(Uri.parse(element.url));
      responseData.pokemons.add(PokemonData.fromMap(jsonDecode(resp.body)));
    }
    print('response: $responseData');
    return responseData;
  }

  Future<ResponseData> getByUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    ResponseData responseData = ResponseData.fromMap(jsonDecode(response.body));
    responseData.results.forEach((element) async {
      http.Response resp = await http.get(Uri.parse(element.url));
      responseData.pokemons.add(PokemonData.fromMap(jsonDecode(resp.body)));
    });
    return responseData;
  }
}
