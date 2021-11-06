import 'dart:convert';

class Data {
  String name;
  String url;

  Data({
    required this.name,
    required this.url,
  });

  Data copyWith({
    String? name,
    String? url,
  }) {
    return Data(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    print(map);
    return Data(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() => 'Data(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Data && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
