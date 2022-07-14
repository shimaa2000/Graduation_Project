import 'package:get/get.dart';
import 'package:graduation_project/translations/ar.dart';
import 'package:graduation_project/translations/en.dart';


class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar
  };
}