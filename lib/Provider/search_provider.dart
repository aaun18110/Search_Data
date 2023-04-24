import 'package:flutter/foundation.dart';

class SearchProvider with ChangeNotifier {
  String _search = "";
  String get search => _search;

   getValue(String value) {
    _search = value;
    notifyListeners();
  }

  // String _position = "";
  // String get position => _position;

  //  getPosition(String val) {
  //   _position = val;
  //   notifyListeners();
  // }
}
