import 'dart:convert';

import 'package:pokedex_flutter/models/data.dart';

class AbilityResponse {
  Data ability;
  bool isHidden;
  int slot;

  AbilityResponse({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  AbilityResponse copyWith({
    Data? ability,
    bool? isHidden,
    int? slot,
  }) {
    return AbilityResponse(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ability': ability.toMap(),
      'is_hidden': isHidden,
      'slot': slot,
    };
  }

  factory AbilityResponse.fromMap(Map<String, dynamic> map) {
    return AbilityResponse(
      ability: Data.fromMap(map['ability']),
      isHidden: map['is_hidden'],
      slot: map['slot'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AbilityResponse.fromJson(String source) =>
      AbilityResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'AbilityResponse(ability: $ability, isHidden: $isHidden, slot: $slot)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AbilityResponse &&
        other.ability == ability &&
        other.isHidden == isHidden &&
        other.slot == slot;
  }

  @override
  int get hashCode => ability.hashCode ^ isHidden.hashCode ^ slot.hashCode;
}
