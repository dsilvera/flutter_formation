import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favoriteChangeNotifier.dart';

class FavoriteIconWidget extends StatefulWidget {
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  bool _isFavorited;

  void _toggleFavorite(FavoriteChangeNotifier _notifier){
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }

      _notifier.isFavorited = _isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteChangeNotifier _notifier = Provider.of<FavoriteChangeNotifier>(context);
    _isFavorited = _notifier.isFavorited;
    return IconButton(
            icon : _isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            color: Colors.red,
            onPressed: ()=>_toggleFavorite(_notifier),
        );
  }
}



class FavoriteTextWidget extends StatefulWidget {
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteChangeNotifier>(
        builder: (context, notifier, _) => Text(notifier.favoriteCount.toString())
    );
  }
}



























