import 'dart:convert';

class ServerError {
  List<dynamic> errors;

  String get errorMessage => errors.join(",");

  ServerError({
    required this.errors,
  });

  Map<String, dynamic> toMap() {
    return {
      'errors': errors,
    };
  }

  factory ServerError.fromMap(Map<String, dynamic> map) {
    List<dynamic> _errors = [];
    if (map['errors'] is List) {
      _errors = map['errors'];
    } else if (map['errors'] is String) {
      _errors = [map['errors']];
    } else if (map['errors'] is Map) {
      _errors = (map['errors']).values.toList();
    }
    return ServerError(
      errors: _errors,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServerError.fromJson(String source) => ServerError.fromMap(json.decode(source));
}
