import 'dart:convert';
import 'data.dart';

class TypeResponse {
  int slot;
  Data type;

  TypeResponse({
    required this.slot,
    required this.type,
  });

  TypeResponse copyWith({
    int? slot,
    Data? type,
  }) {
    return TypeResponse(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'type': type.toMap(),
    };
  }

  factory TypeResponse.fromMap(Map<String, dynamic> map) {
    return TypeResponse(
      slot: map['slot'],
      type: Data.fromMap(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeResponse.fromJson(String source) =>
      TypeResponse.fromMap(json.decode(source));

  @override
  String toString() => 'TypeResponse(slot: $slot, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeResponse && other.slot == slot && other.type == type;
  }

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;
}
