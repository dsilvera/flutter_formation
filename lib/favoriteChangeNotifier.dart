import 'package:flutter/foundation.dart';

class FavoriteChangeNotifier with ChangeNotifier {
  bool _isFavorited;
  final int _favoriteCount;

  FavoriteChangeNotifier(this._isFavorited, this._favoriteCount);

  bool get isFavorited => _isFavorited;

  int get favoriteCount => _favoriteCount + (_isFavorited ? 1 : 0);

  set isFavorited(bool isFavorited) {
    _isFavorited = isFavorited;
    notifyListeners();
  }
}
