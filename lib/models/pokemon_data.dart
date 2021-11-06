import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokedex_flutter/models/data.dart';
import 'package:pokedex_flutter/models/move_response.dart';
import 'package:pokedex_flutter/models/sprite.dart';
import 'package:pokedex_flutter/models/stat_response.dart';
import 'package:pokedex_flutter/models/type_response.dart';

import 'ability_response.dart';

class PokemonData {
  List<AbilityResponse> abilities = <AbilityResponse>[];
  int baseExperience;
  List<Data> forms = <Data>[];
  int id;
  String locationAreaEncounters;
  List<MoveResponse> moves = <MoveResponse>[];
  String name;
  int order;
  Data species;
  Sprite sprites;
  List<StatResponse> stats = <StatResponse>[];
  List<TypeResponse> types = <TypeResponse>[];
  int weight;
  int height;

  PokemonData(
      {required this.abilities,
      required this.baseExperience,
      required this.forms,
      required this.id,
      required this.locationAreaEncounters,
      required this.moves,
      required this.name,
      required this.order,
      required this.species,
      required this.sprites,
      required this.stats,
      required this.types,
      required this.weight,
      required this.height});

  PokemonData copyWith(
      {List<AbilityResponse>? abilities,
      int? baseExperience,
      List<Data>? forms,
      int? id,
      String? locationAreaEncounters,
      List<MoveResponse>? moves,
      String? name,
      int? order,
      Data? species,
      Sprite? sprites,
      List<StatResponse>? stats,
      List<TypeResponse>? types,
      int? weight,
      int? height}) {
    return PokemonData(
        abilities: abilities ?? this.abilities,
        baseExperience: baseExperience ?? this.baseExperience,
        forms: forms ?? this.forms,
        id: id ?? this.id,
        locationAreaEncounters:
            locationAreaEncounters ?? this.locationAreaEncounters,
        moves: moves ?? this.moves,
        name: name ?? this.name,
        order: order ?? this.order,
        species: species ?? this.species,
        sprites: sprites ?? this.sprites,
        stats: stats ?? this.stats,
        types: types ?? this.types,
        weight: weight ?? this.weight,
        height: height ?? this.height);
  }

  Map<String, dynamic> toMap() {
    return {
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'base_experience': baseExperience,
      'forms': forms.map((x) => x.toMap()).toList(),
      'id': id,
      'location_area_encounters': locationAreaEncounters,
      'moves': moves.map((x) => x.toMap()).toList(),
      'name': name,
      'order': order,
      'species': species.toMap(),
      'sprites': sprites.toMap(),
      'stats': stats.map((x) => x.toMap()).toList(),
      'types': types.map((x) => x.toMap()).toList(),
      'weight': weight,
      'height': height
    };
  }

  factory PokemonData.fromMap(Map<String, dynamic> map) {
    return PokemonData(
        abilities: List<AbilityResponse>.from(
            map['abilities']?.map((x) => AbilityResponse.fromMap(x))),
        baseExperience: map['base_experience'],
        forms: List<Data>.from(map['forms']?.map((x) => Data.fromMap(x))),
        id: map['id'],
        locationAreaEncounters: map['location_area_encounters'],
        moves: List<MoveResponse>.from(
            map['moves']?.map((x) => MoveResponse.fromMap(x))),
        name: map['name'],
        order: map['order'],
        species: Data.fromMap(map['species']),
        sprites: Sprite.fromMap(map['sprites']),
        stats: List<StatResponse>.from(
            map['stats']?.map((x) => StatResponse.fromMap(x))),
        types: List<TypeResponse>.from(
            map['types']?.map((x) => TypeResponse.fromMap(x))),
        weight: map['weight'],
        height: map['height']);
  }

  String toJson() => json.encode(toMap());

  factory PokemonData.fromJson(String source) =>
      PokemonData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonData(abilities: $abilities, baseExperience: $baseExperience, forms: $forms, id: $id, locationAreaEncounters: $locationAreaEncounters, moves: $moves, name: $name, order: $order, species: $species, sprites: $sprites, stats: $stats, types: $types, weight: $weight, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonData &&
        listEquals(other.abilities, abilities) &&
        other.baseExperience == baseExperience &&
        listEquals(other.forms, forms) &&
        other.id == id &&
        other.locationAreaEncounters == locationAreaEncounters &&
        listEquals(other.moves, moves) &&
        other.name == name &&
        other.order == order &&
        other.species == species &&
        other.sprites == sprites &&
        listEquals(other.stats, stats) &&
        listEquals(other.types, types) &&
        other.weight == weight &&
        other.height == height;
  }

  @override
  int get hashCode {
    return abilities.hashCode ^
        baseExperience.hashCode ^
        forms.hashCode ^
        id.hashCode ^
        locationAreaEncounters.hashCode ^
        moves.hashCode ^
        name.hashCode ^
        order.hashCode ^
        species.hashCode ^
        sprites.hashCode ^
        stats.hashCode ^
        types.hashCode ^
        weight.hashCode ^
        height.hashCode;
  }
}
