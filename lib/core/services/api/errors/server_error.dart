import 'dart:convert';

class ServerError {
  Map<String, dynamic> errors;

  String get errorMessage => errors.values.join(",");

  ServerError({
    required this.errors,
  });

  Map<String, dynamic> toMap() {
    return {
      'errors': errors,
    };
  }

  factory ServerError.fromMap(Map<String, dynamic> map) {
    return ServerError(
      errors: Map<String, dynamic>.from(map['errors']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServerError.fromJson(String source) => ServerError.fromMap(json.decode(source));
}
