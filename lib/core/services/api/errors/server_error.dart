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
    if (map['msg'] is List) {
      _errors = map['msg'];
    } else if (map['msg'] is String) {
      _errors = [map['msg']];
    } else
      if (map['msg'] is Map) {
      _errors = (map['msg']).values.toList();
    }
    return ServerError(
      errors: _errors,
    );
  }

  String toJson() => json.encode(toMap());

  factory ServerError.fromJson(String source) => ServerError.fromMap(json.decode(source));
}
