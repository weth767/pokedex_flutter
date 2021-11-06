import 'dart:convert';

import 'package:pokedex_flutter/models/data.dart';

class MoveResponse {
  Data move;
  dynamic versionGroupDetails;
  MoveResponse({
    required this.move,
    required this.versionGroupDetails,
  });

  MoveResponse copyWith({
    Data? move,
    dynamic? versionGroupDetails,
  }) {
    return MoveResponse(
      move: move ?? this.move,
      versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'move': move.toMap(),
      'version_group_details': versionGroupDetails,
    };
  }

  factory MoveResponse.fromMap(Map<String, dynamic> map) {
    return MoveResponse(
      move: Data.fromMap(map['move']),
      versionGroupDetails: map['version_group_details'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MoveResponse.fromJson(String source) =>
      MoveResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'MoveResponse(move: $move, versionGroupDetails: $versionGroupDetails)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoveResponse &&
        other.move == move &&
        other.versionGroupDetails == versionGroupDetails;
  }

  @override
  int get hashCode => move.hashCode ^ versionGroupDetails.hashCode;
}
