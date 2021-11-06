import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokedex_flutter/models/data.dart';
import 'package:pokedex_flutter/models/pokemon_data.dart';

class ResponseData {
  int count = 0;
  String? next;
  String? previous;
  List<Data> results = <Data>[];
  List<PokemonData> pokemons = <PokemonData>[];

  ResponseData({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  ResponseData copyWith({
    int? count,
    String? next,
    String? previous,
    List<Data>? results,
  }) {
    return ResponseData(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory ResponseData.fromMap(Map<String, dynamic> map) {
    return ResponseData(
      count: map['count'],
      next: map['next'],
      previous: map['previous'],
      results: List<Data>.from(map['results']?.map((x) => Data.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseData.fromJson(String source) =>
      ResponseData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResponseData(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseData &&
        other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }
}
