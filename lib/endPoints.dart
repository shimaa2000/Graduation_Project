import 'package:intl/intl.dart';

const LOGIN = 'https://enigmatic-reaches-98451.herokuapp.com/api/user/login';
const SIGN = 'https://enigmatic-reaches-98451.herokuapp.com/api/user/signup';
const USERDATA='https://enigmatic-reaches-98451.herokuapp.com/api/user/';
const HOME ='https://enigmatic-reaches-98451.herokuapp.com/api/product';
String? TOKEN;
const String ENGLISH = 'en';
const String ARABIC = 'ar';

String? lang;
String? defaultLang;
bool isDark = false;

dynamic languageFun({
  required ar, required en
}){
  return lang !=null ?
      lang =='ar'? ar: en
           :(defaultLang == 'ar'?ar:en);
}
