import 'dart:convert';

import 'data.dart';

class StatResponse {
  int baseStat;
  int effort;
  Data stat;

  StatResponse({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  StatResponse copyWith({
    int? baseStat,
    int? effort,
    Data? stat,
  }) {
    return StatResponse(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'base_stat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory StatResponse.fromMap(Map<String, dynamic> map) {
    return StatResponse(
      baseStat: map['base_stat'],
      effort: map['effort'],
      stat: Data.fromMap(map['stat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatResponse.fromJson(String source) =>
      StatResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'StatResponse(baseStat: $baseStat, effort: $effort, stat: $stat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StatResponse &&
        other.baseStat == baseStat &&
        other.effort == effort &&
        other.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}
